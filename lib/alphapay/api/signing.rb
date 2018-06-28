module AlphaPay

  module API

    # Setup Basic Params
    module Signing

      NOUNCE_LENGTH = 26

      def signature
        Signature.call
      end

      # Signature
      class Signature

        extend AlphaPay::Callable

        def call
          {
            nonce_str: nonce,
            time: time,
            sign: sign
          }
        end

        def sign
          @sign ||=
            Digest::SHA256.hexdigest(sign_params).downcase
        end

        def sign_params
          @sign_params ||=
            "#{AlphaPay.partner_code}&#{time}&#{nonce}&#{AlphaPay.credential_code}"
        end

        def nonce
          @nonce ||=
            (0..(NOUNCE_LENGTH - 1)).map { pattern[rand(pattern.length)] }.join
        end

        def time
          @time ||=
            (Time.now.to_f * 1000).to_i
        end

        private

        def pattern
          [('a'..'z')].map(&:to_a).flatten
        end

      end

    end

  end

end
