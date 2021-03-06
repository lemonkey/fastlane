module Fastlane
  module Actions
    module SharedValues
      DEFAULT_PLATFORM = :DEFAULT_PLATFORM
    end

    class DefaultPlatformAction < Action
      def self.run(params)
        raise "You forgot to pass the default platform".red if params.first.nil?

        platform = params.first.to_sym

        SupportedPlatforms.verify! platform

        Actions.lane_context[SharedValues::DEFAULT_PLATFORM] = platform
      end

      def self.description
        "Defines a default platform to not have to specify the platform"
      end

      def self.author
        "KrauseFx"
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
