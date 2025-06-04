class Settings
  def initialize
    @configurations = {}
  end

  def add(key, value)
    @configurations[key.to_sym] = value

    define_singleton_method(key) do
      @configurations[key.to_sym]
    end
  end

  def method_missing(name, *args, &block)
    if @configurations.key?(name)
      @configurations[name]
    else
      "Configuração '#{name}' não existe."
    end
  end

  def respond_to_missing?(name, include_private = false)
    @configurations.key?(name) || super
  end
end

# Testes

settings = Settings.new

settings.add(:timeout, 5)
settings.add(:mode, "develop")

puts settings.timeout
puts settings.mode
puts settings.retry

puts settings.respond_to?(:timeout)
puts settings.respond_to?(:retry)
