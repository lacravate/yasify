# encoding: utf-8

require "pathstring"

class Yasify < Pathstring

  def read
    YAML.load(super) rescue {}
  end

  def unit
    (exist? ? read : content) || {}
  end

  def item(label)
    unit[label] || {}
  end

  def clear!(label)
    save! label => {}
  end

  def []=(label, item)
    save! label => item
  end

  alias :[] :item
  alias :unit= :content=

  private

  def persist(item={})
    super YAML.dump(unit.merge(item))
  end

end
