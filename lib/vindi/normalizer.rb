module Vindi
  class Normalizer

    def initialize(resource_name)
      @resource_name = resource_name
    end

    def demodulize
      if i = @resource_name.rindex('::')
        @resource_name = @resource_name[(i+2)..-1]
      end
      self
    end

    def underscore
      return self unless @resource_name =~ /[A-Z-]|::/
      @resource_name = @resource_name.to_s.gsub(/::/, '/')
      @resource_name.gsub!(/(?:(?<=([A-Za-z\d]))|\b)(#{acronym_regex})(?=\b|[^a-z])/) { "#{$1 && '_'}#{$2.downcase}" }
      @resource_name.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
      @resource_name.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
      @resource_name.tr!("-", "_")
      @resource_name.downcase!
      self
    end

    def pluralize
      @resource_name += 'es' if @resource_name[-1] == 'h'
      @resource_name += 's'
      self
    end

    def to_s
      @resource_name
    end

    private

    def acronym_regex
      /(?=a)b/
    end

  end
end
