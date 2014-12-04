  # inicializado com function(w) recebendo window
  d = w.document

  getEl = (el) ->
    d.createElement el
  getAttr = (el) ->
    d.createAttribute el
  setAttr = (el, attr) ->
    el.setAttributeNode attr
  addChild = (el, child) ->
    el.appendChild child

  w._barrabrasil = $B =
    setCss: (css) ->
        css = css.replace /_b_/g, 'barra-brasil'
        style = getEl("style")
        tipo = getAttr("type")
        tipo.value = "text/css"
        media = getAttr("media")
        media.value = "all"
        setAttr style, tipo #Para IE8. Quando suporte cair utilizar setAttribute "type","text/css"
        setAttr style, media #Para IE8. Quando suporte cair utilizar setAttribute "media","all"

        if style.styleSheet #Hack para IE8
            style.styleSheet.cssText = css
        else
            addChild style, d.createTextNode(css)

        addChild d.getElementsByTagName("head")[0], style
    init: (id, css, conteudo) ->
        divBarra = d.getElementById id
        if divBarra
          this.setCss css
          divBarra.removeAttribute "style"
          divBarra.innerHTML = conteudo.replace /\$([^\$]+)\$/g, 'http://www.$1.gov.br'
        return
