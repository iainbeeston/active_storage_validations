# frozen_string_literal: true

require_relative 'base_size_validator_matcher'

module ActiveStorageValidations
  module Matchers
    def validate_total_size_of(attribute_name)
      TotalSizeValidatorMatcher.new(attribute_name)
    end

    class TotalSizeValidatorMatcher < BaseSizeValidatorMatcher
      def description
        "validate total file size of :#{@attribute_name}"
      end

      def failure_message
        message = ["is expected to validate total file size of :#{@attribute_name}"]
        build_failure_message(message)
        message.join("\n")
      end

      protected

      def attach_file
        # has_many_attached relation
        @subject.public_send(@attribute_name).attach([dummy_blob])
        @subject.public_send(@attribute_name)
      end
    end
  end
end
