module AlphaPay

  module API

    # Requests Module
    module Requests

      def self.included(base)
        base.extend ClassMethods
      end

      # ClassMethods
      module ClassMethods

        METHOD_WHITELIST = %i[connect qrcode convert].freeze

        def respond_to_missing?(method_name, include_private = false)
          callable?(method_name) || super
        end

        def method_missing(method_name, *args, &block)
          callable?(method_name) ? new(*args).send(method_name, &block) : super
        end

        def callable?(method_name)
          METHOD_WHITELIST.include? method_name
        end

      end

      module_function

      def missing_keys?
        AlphaPay.partner_code.nil? ||
          AlphaPay.credential_code.nil?
      end

      def encode_params(params:)
        URI.encode_www_form(params)
      end

    end

  end

end
