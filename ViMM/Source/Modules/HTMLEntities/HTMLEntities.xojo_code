#tag Module
Protected Module HTMLEntities
	#tag Method, Flags = &h21
		Private Function ArrayPopulated() As Boolean
		  return (entities(0) <> nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EscapeHTML(Extends Input As String) As String
		  return EscapeHTML(Input)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function EscapeHTML(Input As String) As String
		  TestHTMLDictionary
		  
		  dim newString(-1),c,s as string
		  dim i as integer
		  
		  redim newString(len(input))
		  
		  for i = 0 to len(input)
		    s = mid(input,i,1)
		    c = reversehtmlcharacter(s)
		    if c <> s then
		      c = "&" + c + ";"
		    end
		    newstring(i) = c
		  next
		  
		  return join(newstring,"")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetCharacterForSymbol(Symbol As String) As String
		  dim i as integer
		  for i = 0 to ubound(entities)
		    if strcomp(entities(i).symbol,symbol,0) = 0 then
		      return entities(i).character
		    end
		  next
		  return symbol
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetSymbolForCharacter(Character As String) As String
		  if character <> " " then
		    dim i as integer
		    for i = 0 to ubound(entities)
		      if strcomp(entities(i).character,character,0) = 0 then
		        return entities(i).symbol
		      end
		    next
		    return character
		  else
		    return character
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReverseHTMLCharacter(Input As String) As String
		  TestHTMLDictionary
		  
		  if len(input) = 1 then
		    return GetSymbolForCharacter(Input)
		  else
		    return GetCharacterForSymbol(Input)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestHTMLDictionary()
		  if not ArrayPopulated then
		    Entities(0) = New HTMLEntity("""","quot")
		    Entities(1) = New HTMLEntity("&","amp")
		    Entities(2) = New HTMLEntity("<","lt")
		    Entities(3) = New HTMLEntity(">","gt")
		    Entities(4) = New HTMLEntity("™","trade")
		    Entities(5) = New HTMLEntity("¡","iexcl")
		    Entities(6) = New HTMLEntity("¢","cent")
		    Entities(7) = New HTMLEntity("£","pound")
		    Entities(8) = New HTMLEntity("¤","curren")
		    Entities(9) = New HTMLEntity("¥","yen")
		    Entities(10) = New HTMLEntity("¦","brvbar")
		    Entities(11) = New HTMLEntity("§","sect")
		    Entities(12) = New HTMLEntity("¨","uml")
		    Entities(13) = New HTMLEntity("©","copy")
		    Entities(14) = New HTMLEntity("ª","ordf")
		    Entities(15) = New HTMLEntity("«","laquo")
		    Entities(16) = New HTMLEntity("¬","not")
		    Entities(17) = New HTMLEntity("­","shy")
		    Entities(18) = New HTMLEntity("®","reg")
		    Entities(19) = New HTMLEntity("¯","macr")
		    Entities(20) = New HTMLEntity("°","deg")
		    Entities(21) = New HTMLEntity("±","plusmn")
		    Entities(22) = New HTMLEntity("²","sup2")
		    Entities(23) = New HTMLEntity("³","sup3")
		    Entities(24) = New HTMLEntity("´","acute")
		    Entities(25) = New HTMLEntity("µ","micro")
		    Entities(26) = New HTMLEntity("¶","para")
		    Entities(27) = New HTMLEntity("·","middot")
		    Entities(28) = New HTMLEntity("¸","cedil")
		    Entities(29) = New HTMLEntity("¹","sup1")
		    Entities(30) = New HTMLEntity("º","ordm")
		    Entities(31) = New HTMLEntity("»","raquo")
		    Entities(32) = New HTMLEntity("¼","frac14")
		    Entities(33) = New HTMLEntity("½","frac12")
		    Entities(34) = New HTMLEntity("¾","frac34")
		    Entities(35) = New HTMLEntity("¿","iquest")
		    Entities(36) = New HTMLEntity("à","Agrave")
		    Entities(37) = New HTMLEntity("Á","Aacute")
		    Entities(38) = New HTMLEntity("Â","Acirc")
		    Entities(39) = New HTMLEntity("Ã","Atilde")
		    Entities(40) = New HTMLEntity("Ä","Auml")
		    Entities(41) = New HTMLEntity("Å","Aring")
		    Entities(42) = New HTMLEntity("Æ","AElig")
		    Entities(43) = New HTMLEntity("Ç","Ccedil")
		    Entities(44) = New HTMLEntity("È","Egrave")
		    Entities(45) = New HTMLEntity("É","Eacute")
		    Entities(46) = New HTMLEntity("Ê","Ecirc")
		    Entities(47) = New HTMLEntity("Ë","Euml")
		    Entities(48) = New HTMLEntity("Ì","Igrave")
		    Entities(49) = New HTMLEntity("Í","Iacute")
		    Entities(50) = New HTMLEntity("Î","Icirc")
		    Entities(51) = New HTMLEntity("Ï","Iuml")
		    Entities(52) = New HTMLEntity("ð","eth")
		    Entities(53) = New HTMLEntity("Ñ","Ntilde")
		    Entities(54) = New HTMLEntity("Ò","Ograve")
		    Entities(55) = New HTMLEntity("Ó","Oacute")
		    Entities(56) = New HTMLEntity("Ô","Ocirc")
		    Entities(57) = New HTMLEntity("Õ","Otilde")
		    Entities(58) = New HTMLEntity("Ö","Ouml")
		    Entities(59) = New HTMLEntity("×","times")
		    Entities(60) = New HTMLEntity("Ø","Oslash")
		    Entities(61) = New HTMLEntity("Ù","Ugrave")
		    Entities(62) = New HTMLEntity("Ú","Uacute")
		    Entities(63) = New HTMLEntity("Û","Ucirc")
		    Entities(64) = New HTMLEntity("Ü","Uuml")
		    Entities(65) = New HTMLEntity("Ý","Yacute")
		    Entities(66) = New HTMLEntity("þ","thorn")
		    Entities(67) = New HTMLEntity("ß","szlig")
		    Entities(68) = New HTMLEntity("à","agrave")
		    Entities(69) = New HTMLEntity("á","aacute")
		    Entities(70) = New HTMLEntity("â","acirc")
		    Entities(71) = New HTMLEntity("ã","atilde")
		    Entities(72) = New HTMLEntity("ä","auml")
		    Entities(73) = New HTMLEntity("å","aring")
		    Entities(74) = New HTMLEntity("æ","aelig")
		    Entities(75) = New HTMLEntity("ç","ccedil")
		    Entities(76) = New HTMLEntity("è","egrave")
		    Entities(77) = New HTMLEntity("é","eacute")
		    Entities(78) = New HTMLEntity("ê","ecirc")
		    Entities(79) = New HTMLEntity("ë","euml")
		    Entities(80) = New HTMLEntity("ì","igrave")
		    Entities(81) = New HTMLEntity("í","iacute")
		    Entities(82) = New HTMLEntity("î","icirc")
		    Entities(83) = New HTMLEntity("ï","iuml")
		    Entities(84) = New HTMLEntity("ð","eth")
		    Entities(85) = New HTMLEntity("ñ","ntilde")
		    Entities(86) = New HTMLEntity("ò","ograve")
		    Entities(87) = New HTMLEntity("ó","oacute")
		    Entities(88) = New HTMLEntity("ô","ocirc")
		    Entities(89) = New HTMLEntity("õ","otilde")
		    Entities(90) = New HTMLEntity("ö","ouml")
		    Entities(91) = New HTMLEntity("÷","divide")
		    Entities(92) = New HTMLEntity("ø","oslash")
		    Entities(93) = New HTMLEntity("ù","ugrave")
		    Entities(94) = New HTMLEntity("ú","uacute")
		    Entities(95) = New HTMLEntity("û","ucirc")
		    Entities(96) = New HTMLEntity("ü","uuml")
		    Entities(97) = New HTMLEntity("ý","yacute")
		    Entities(98) = New HTMLEntity("þ","thorn")
		    Entities(99) = New HTMLEntity("ÿ","yuml")
		    Entities(100) = New HTMLEntity("Α","Alpha")
		    Entities(101) = New HTMLEntity("Β","Beta")
		    Entities(102) = New HTMLEntity("Γ","Gamma")
		    Entities(103) = New HTMLEntity("Δ","Delta")
		    Entities(104) = New HTMLEntity("Ε","Epsilon")
		    Entities(105) = New HTMLEntity("Ζ","Zeta")
		    Entities(106) = New HTMLEntity("Η","Eta")
		    Entities(107) = New HTMLEntity("Θ","Theta")
		    Entities(108) = New HTMLEntity("Ι","Iota")
		    Entities(109) = New HTMLEntity("Κ","Kappa")
		    Entities(110) = New HTMLEntity("Λ","Lambda")
		    Entities(111) = New HTMLEntity("Η","Eta")
		    Entities(112) = New HTMLEntity("Θ","Theta")
		    Entities(113) = New HTMLEntity("Ι","Iota")
		    Entities(114) = New HTMLEntity("Κ","Kappa")
		    Entities(115) = New HTMLEntity("Λ","Lambda")
		    Entities(116) = New HTMLEntity("Μ","Mu")
		    Entities(117) = New HTMLEntity("Ν","Nu")
		    Entities(118) = New HTMLEntity("Ξ","Xi")
		    Entities(119) = New HTMLEntity("Ο","Omicron")
		    Entities(120) = New HTMLEntity("Π","Pi")
		    Entities(121) = New HTMLEntity("Ρ","Rho")
		    Entities(122) = New HTMLEntity("Σ","Sigma")
		    Entities(123) = New HTMLEntity("Τ","Tau")
		    Entities(124) = New HTMLEntity("Υ","Upsilon")
		    Entities(125) = New HTMLEntity("Φ","Phi")
		    Entities(126) = New HTMLEntity("Χ","Chi")
		    Entities(127) = New HTMLEntity("Ψ","Psi")
		    Entities(128) = New HTMLEntity("Ω","Omega")
		    Entities(129) = New HTMLEntity("α","alpha")
		    Entities(130) = New HTMLEntity("β","beta")
		    Entities(131) = New HTMLEntity("γ","gamma")
		    Entities(132) = New HTMLEntity("δ","delta")
		    Entities(133) = New HTMLEntity("ε","epsilon")
		    Entities(134) = New HTMLEntity("ζ","zeta")
		    Entities(135) = New HTMLEntity("η","eta")
		    Entities(136) = New HTMLEntity("θ","theta")
		    Entities(137) = New HTMLEntity("ι","iota")
		    Entities(138) = New HTMLEntity("κ","kappa")
		    Entities(139) = New HTMLEntity("λ","lambda")
		    Entities(140) = New HTMLEntity("μ","mu")
		    Entities(141) = New HTMLEntity("ν","nu")
		    Entities(142) = New HTMLEntity("ξ","xi")
		    Entities(143) = New HTMLEntity("ο","omicron")
		    Entities(144) = New HTMLEntity("π","pi")
		    Entities(145) = New HTMLEntity("ρ","rho")
		    Entities(146) = New HTMLEntity("ς","sigmaf")
		    Entities(147) = New HTMLEntity("σ","sigma")
		    Entities(148) = New HTMLEntity("τ","tau")
		    Entities(149) = New HTMLEntity("υ","upsilon")
		    Entities(150) = New HTMLEntity("φ","phi")
		    Entities(151) = New HTMLEntity("χ","chi")
		    Entities(152) = New HTMLEntity("ψ","psi")
		    Entities(153) = New HTMLEntity("ω","omega")
		    Entities(154) = New HTMLEntity("ϑ","thetasym")
		    Entities(155) = New HTMLEntity("ϒ","upsih")
		    Entities(156) = New HTMLEntity("ϖ","piv")
		    Entities(157) = New HTMLEntity("•","bull")
		    Entities(158) = New HTMLEntity("…","hellip")
		    Entities(159) = New HTMLEntity("′","prime")
		    Entities(160) = New HTMLEntity("″","Prime")
		    Entities(161) = New HTMLEntity("‾","oline")
		    Entities(162) = New HTMLEntity("⁄","frasl")
		    Entities(163) = New HTMLEntity("℘","weierp")
		    Entities(164) = New HTMLEntity("ℑ","image")
		    Entities(165) = New HTMLEntity("ℜ","real")
		    Entities(166) = New HTMLEntity("ℵ","alefsym")
		    Entities(167) = New HTMLEntity("←","larr")
		    Entities(168) = New HTMLEntity("↑","uarr")
		    Entities(169) = New HTMLEntity("→","rarr")
		    Entities(170) = New HTMLEntity("↓","darr")
		    Entities(171) = New HTMLEntity("↔","harr")
		    Entities(172) = New HTMLEntity("↵","crarr")
		    Entities(173) = New HTMLEntity("⇐","lArr")
		    Entities(174) = New HTMLEntity("⇑","uArr")
		    Entities(175) = New HTMLEntity("⇒","rArr")
		    Entities(176) = New HTMLEntity("⇓","dArr")
		    Entities(177) = New HTMLEntity("⇔","hArr")
		    Entities(178) = New HTMLEntity("∀","forall")
		    Entities(179) = New HTMLEntity("∂","part")
		    Entities(180) = New HTMLEntity("∃","exist")
		    Entities(181) = New HTMLEntity("∅","empty")
		    Entities(182) = New HTMLEntity("∇","nabla")
		    Entities(183) = New HTMLEntity("∈","isin")
		    Entities(184) = New HTMLEntity("∉","notin")
		    Entities(185) = New HTMLEntity("∋","ni")
		    Entities(186) = New HTMLEntity("∏","prod")
		    Entities(187) = New HTMLEntity("∑","sum")
		    Entities(188) = New HTMLEntity("−","minus")
		    Entities(189) = New HTMLEntity("∗","lowast")
		    Entities(190) = New HTMLEntity("√","radic")
		    Entities(191) = New HTMLEntity("∝","prop")
		    Entities(192) = New HTMLEntity("∞","infin")
		    Entities(193) = New HTMLEntity("∠","ang")
		    Entities(194) = New HTMLEntity("∧","and")
		    Entities(195) = New HTMLEntity("∨","or")
		    Entities(196) = New HTMLEntity("∩","cap")
		    Entities(197) = New HTMLEntity("∪","cup")
		    Entities(198) = New HTMLEntity("∫","int")
		    Entities(199) = New HTMLEntity("∴","there4")
		    Entities(200) = New HTMLEntity("∼","sim")
		    Entities(201) = New HTMLEntity("≅","cong")
		    Entities(202) = New HTMLEntity("≈","asymp")
		    Entities(203) = New HTMLEntity("≠","ne")
		    Entities(204) = New HTMLEntity("≡","equiv")
		    Entities(205) = New HTMLEntity("≤","le")
		    Entities(206) = New HTMLEntity("≥","ge")
		    Entities(207) = New HTMLEntity("⊂","sub")
		    Entities(208) = New HTMLEntity("⊃","sup")
		    Entities(209) = New HTMLEntity("⊄","nsub")
		    Entities(210) = New HTMLEntity("⊆","sube")
		    Entities(211) = New HTMLEntity("⊇","supe")
		    Entities(212) = New HTMLEntity("⊕","oplus")
		    Entities(213) = New HTMLEntity("⊗","otimes")
		    Entities(214) = New HTMLEntity("⊥","perp")
		    Entities(215) = New HTMLEntity("⋅","sdot")
		    Entities(216) = New HTMLEntity("⌈","lceil")
		    Entities(217) = New HTMLEntity("⌉","rceil")
		    Entities(218) = New HTMLEntity("⌊","lfloor")
		    Entities(219) = New HTMLEntity("⌋","rfloor")
		    Entities(220) = New HTMLEntity("◊","loz")
		    Entities(221) = New HTMLEntity("♠","spades")
		    Entities(222) = New HTMLEntity("♣","clubs")
		    Entities(223) = New HTMLEntity("♥","hearts")
		    Entities(224) = New HTMLEntity("♦","diams")
		    Entities(225) = New HTMLEntity(" ","nbsp")
		    Entities(226) = New HTMLEntity("—", "mdash")
		    Entities(227) = New HTMLEntity("’", "rsquo" )
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnescapeHTML(Extends Input As String) As String
		  return UnescapeHTML(Input)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function UnescapeHTML(Input As String) As String
		  TestHTMLDictionary
		  
		  dim r as new regex
		  dim m as regexmatch
		  dim s as string = input
		  dim c as string
		  r.searchpattern = "&(\w+);"
		  do
		    m = r.search(s)
		    if m <> nil then
		      c = reversehtmlcharacter(m.subexpressionstring(1))
		      dim firstChunk as string = leftb(s,m.subexpressionstartb(0))
		      dim secondChunk as string = rightb(s,lenb(s) - (lenb(firstChunk) + lenb(m.subexpressionstring(0))))
		      s = firstChunk + c + secondChunk
		    end
		  loop until m = nil
		  
		  r.searchpattern = "&\#(\d{2,4});"
		  do
		    m = r.search(s)
		    if m <> nil then
		      c = encodings.utf8.chr(val(m.subexpressionstring(1)))
		      dim firstChunk as string = leftb(s,m.subexpressionstartb(0))
		      dim secondChunk as string = rightb(s,lenb(s) - (lenb(firstChunk) + lenb(m.subexpressionstring(0))))
		      s = firstChunk + c + secondChunk
		    end
		  loop until m = nil
		  
		  return s
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Entities(227) As HTMLEntity
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
