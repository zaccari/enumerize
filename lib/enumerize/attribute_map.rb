module Enumerize
  class AttributeMap
    def initialize
      @attributes = {}
      @dependants = []
    end

    def [](name)
      @attributes[name]
    end

    def <<(attr)
      @attributes[attr.name] = attr
      @dependants.each do |dependant|
        dependant << attr
      end
    end

    def each
      @attributes.each_pair do |_name, attr|
        yield attr
      end
    end

    def empty?
      @attributes.empty?
    end

    def add_dependant(dependant)
      @dependants << dependant
      each do |attr|
        dependant << attr
      end
    end
  end
end