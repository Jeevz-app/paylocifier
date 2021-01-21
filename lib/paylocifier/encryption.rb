require 'openssl'

require_relative '../paylocifier'

class Paylocifier::Encryption
  ALG = "AES-256-CBC".freeze

  def self.encode(data)
    if Paylocifier.config.encryption_key_path.nil?
      raise 'Must provide path to encryption public key pem file'
    end

    # 1 Encrypt this JSON payload using your own key and IV (NOT with the Paylocity public key)
    aes = OpenSSL::Cipher::AES.new(256, :CBC)
    aes.encrypt

    key = aes.random_key
    iv  = aes.random_iv

    encrypted_data = aes.update(data.to_json) + aes.final
    encoded_data64 = Base64.strict_encode64(encrypted_data)

    # 2 RSA encrypt the key you used in step 2 with the Paylocity Public Key, then, base64 encode the result
    public_key = OpenSSL::PKey::RSA.new(File.read(Paylocifier.config.encryption_key_path))

    encrypted_key64 = Base64.strict_encode64(public_key.public_encrypt(key))
    # 3 Base64 encode the IV used to encrypt the JSON payload in step 2
    encoded_iv64   = Base64.strict_encode64(iv)
    # 4 Put together a "secureContent" JSON object:
    {
      secureContent: {
        key:      encrypted_key64,
        iv:       encoded_iv64,
        content:  encoded_data64
      }
    }
  end
end
