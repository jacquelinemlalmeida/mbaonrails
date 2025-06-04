class HtmlBuilder
  def initialize(&block)
    @html = ""
    instance_eval(&block) if block_given?
  end

  # usa blocos dentro de cada tipo para causar o efeito de "aninhamento"
  def div(content = nil, &block)
    @html << "<div>"
    if block_given?
      instance_eval(&block)
    else
      @html << content.to_s
    end
    @html << "</div>"
  end

  def span(content = nil, &block)
    @html << "<span>"
    if block_given?
      instance_eval(&block)
    else
      @html << content.to_s
    end
    @html << "</span>"
  end

  def a(content = nil, &block)
    @html << "<a>"
    if block_given?
      instance_eval(&block)
    else
      @html << content.to_s
    end
    @html << "</a>"
  end

  def result
    @html
  end
end

# Testes
builder = HtmlBuilder.new do
  div do
    div "Conteúdo em div"
    span "Nota em div"

    span do
      a "Link na nota de rodapé do span"
    end
  end
end

puts builder.result
