class Object
  LOADED_CONSTANTS = {}

  def self.const_missing(c)
    if LOADED_CONSTANTS[c]
      return nil
    else
      # This is hacky but prevents an endless loop of calling `#const_get`
      # in the event the require file doesn't actually include the object.
      LOADED_CONSTANTS[c] = true
      # Neat way to dynamically require controller path
      require Sliar.to_underscore(c.to_s)
      # Fetches the actual object
      Object.const_get(c)
    end
  end
end
