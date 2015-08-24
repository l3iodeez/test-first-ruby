class XmlDocument
  def initialize(bool = false)
    bool ? @indents = true : nil
  end
  def block_depth=(value)
    @block_depth = value
  end
  def block_depth
    @block_depth || 0
  end
   def track_block_depth(&block)
    self.block_depth += 1
    yield
    ensure
    self.block_depth -= 1
  end

  def tag(str, opts = {})
    output = ''
    indent = ''
    if block_given?
      track_block_depth do 
        optstring = ""
        opts.each do |e|
          optstring += %Q| #{e[0].to_s}="#{e[1].to_s}"|
        end
        (self.block_depth - 1).times do 
          indent += (@indents ? "  " : '')
        end
        output = indent + "<" + str + optstring + ">" + (@indents ? "\n" : '') 
        output += yield
        output += indent + "</" + str + ">" + (@indents ? "\n" : '')
        output
      end
    else
        optstring = ""
        opts.each do |e|
          optstring += %Q| #{e[0].to_s}="#{e[1].to_s}"|
        end
        (self.block_depth).times do 
          indent += (@indents ? "  " : '')
        end
        output = indent + "<" + str + optstring + "/>" + (@indents ? "\n" : '')
    end
  end
  def method_missing(methId, opts = {})
    if block_given?
       tag(methId.id2name, opts){yield}
     else
       tag(methId.id2name, opts)
     end
  end
end
