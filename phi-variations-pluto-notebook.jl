### A Pluto.jl notebook ###
# v0.14.7

using Markdown
using InteractiveUtils

# ╔═╡ 0260aa1d-d487-4f21-af11-752b4409a458
begin
	using DataFrames
	
	df = DataFrame(udec=Int64[], uhex=String[], glyph=String[], lx=String[], desc=String[])
	
	for i in (
	    [0x00278, "ɸ", "\\ltphi", "Latin Small Letter Phi"] ,
	    [0x003C6, "φ", "\\varphi", "Greek Small Letter Phi"] ,
	    [0x003D5, "ϕ", "\\phi", "Greek Phi Symbol / Greek Small Letter Script Phi"] ,
	    [0x01D60, "ᵠ", "\\^phi", "Modifier Letter Small Greek Phi"] ,
	    [0x01D69, "ᵩ", "\\_phi", "Greek Subscript Small Letter Phi"] ,
	    [0x1D6D7, "𝛗", "\\bfvarphi", "Mathematical Bold Small Phi"] ,
	    [0x1D6DF, "𝛟", "\\bfphi", "Mathematical Bold Phi Symbol"] ,
	    [0x1D711, "𝜑", "\\itphi", "Mathematical Italic Small Phi"] ,
	    [0x1D719, "𝜙", "\\itvarphi", "Mathematical Italic Phi Symbol"] ,
	    [0x1D74B, "𝝋", "\\biphi", "Mathematical Bold Italic Small Phi"] ,
	    [0x1D753, "𝝓", "\\bivarphi", "Mathematical Bold Italic Phi Symbol"] ,
	    [0x1D785, "𝞅", "\\bsansphi", "Mathematical Sans-Serif Bold Small Phi"] ,
	    [0x1D78D, "𝞍", "\\bsansvarphi", "Mathematical Sans-Serif Bold Phi Symbol"] ,
	    [0x1D7BF, "𝞿", "\\bisansphi", "Mathematical Sans-Serif Bold Italic Small Phi"] ,
	    [0x1D7C7, "𝟇", "\\bisansvarphi", "Mathematical Sans-Serif Bold Italic Phi Symbol"])
	    push!(df, (i[1], string(i[1], base=16), string(Char(i[1])), i[3], i[4]))
	end
	df
end

# ╔═╡ ecbda36f-a6a4-4ad9-a0b6-7b5d2124eb08
begin
	using Luxor
	
	fontlist = [
	        "Anonymous Pro", 
			"CascadiaCode-Regular",
	        "Consolas",
	        "Courier New", 
	        "CourierPrime-Regular", 
		    "Cousine-Regular",
	        "DejaVuSansMono", 
	        "EnvyCodeR",
	        "EversonMono",
	        
	        "FiraCode-Regular",
	        "GoMono",
	        "Hack-Regular", 
	        "Helvetica", 
	        "InputMono", 
			"JuliaMono",
		    
	        "LucidaConsole", 
	        "LucidaSansUnicode", 
	        "Menlo", 
	        "Monaco",
		    "OxygenMono-Regular", 
	        "Pragmata Pro", 
		"RecMonoLinear-Regular",
			"SFMono-Regular",		

        "SourceCodePro-Regular",

	        "Ubuntu Mono", 
	        "Victor Mono"]
	d = Drawing(1200, 1100, :svg)
	origin()
	fontsize(26)
	fontface("JuliaMono")
	table = Table(fill(1100/(1 + length(fontlist)), 1 + length(fontlist)), 	fill(900/4, 4))
	text("U+03D5 $(string(Char(0x03D5)))", table[1, 1], halign=:left)
	text("U+0278 $(string(Char(0x0278)))", table[1, 2], halign=:left)
	text("U+03C6 $(string(Char(0x03C6)))", table[1, 3], halign=:left)
	for (i, f) in enumerate(fontlist)
		j = i + 1
	    fontface(f)
	    text(f, table[j, 4], halign=:left)
	    text("$(string(Char(0x03D5)))", table[j, 1])
	    text("$(string(Char(0x0278)))", table[j, 2])
	    text("$(string(Char(0x03C6)))", table[j, 3])
	end
	finish()
	d
end

# ╔═╡ 16139366-454f-11ec-2bdf-09e961bede61
md"# Phi variations"

# ╔═╡ 073e295b-cef3-47e4-8a52-c8459855ff8d
md"The Greek letter Phi is used throughout Greece, maths, physics, and computing. 

The three  main versions used in Unicode are:

- 03D5: ϕ 
- 03C6: φ 
- 0278: ɸ 

Every font has its own designs for these three glyphs. The designs above are shown in Pluto's default font, Alegreya.

But in fact there are about 20 different versions of the phi character in the Unicode tables, and every font chooses which designs to show for each one. If you run this code you'll see the versions for the current font. 

Remember, though, that font fallbacks are used: ie, if the current font doesn't have a glyph for a character, then other fonts are searched until a suitable glyph is found."

# ╔═╡ f693c61e-5c5e-4e09-9252-49a35b8f5ba3
md" In Julia, the Golden Ratio Phi, 1.618... is available as the constant `MathConstants.golden`. It's known as the `varphi` version of phi, and you can type it in the REPL with the LATEX completion `\\varphi`. The Unicode character code of this is `03c6`, φ"

# ╔═╡ 6afdbbba-3d22-4448-8a9a-6d5f4eb431e7
MathConstants.golden

# ╔═╡ ff137e6c-d068-4feb-a20e-b8f6f5d379a2
md"## Phi and varphi

This \\varphi (03C6: φ) version of Phi is called \"the loopy\" version in the Unicode documentation:"

# ╔═╡ bb0d519b-45ea-4640-b0f2-adc4498f3b21
md" > For mathematical and technical use, the straight form φ of the small phi is an important symbol (TEX `\phi` U+03D5) and needs to be consistently distinguishable from the loopy form (TEX `\varphi` U+03C6). The straight form phi glyph 03D5 ϕ is used as the representative glyph for the phi symbol at U+03D5 to satisfy this distinction. 

> ... U+03C6 ... should be reserved for codes or entities that represent the small phi as used in ordinary Greek text. 

> (http://unicode.org/reports/tr25/)

Most fonts draw the loopy Phi glyph using a loop, but a few fonts don't make the distinction.
"

# ╔═╡ c5168def-a61a-4fd5-9354-c410e11a1645
md" ## Font variations "

# ╔═╡ 72a415ad-a694-4cd5-9726-4257b88874a8
md" Let's draw these symbols using some different fonts."

# ╔═╡ 5f9c2445-d749-4e96-9a92-8b51f4ba20ce
md" This version of the Consolas font has swapped the \\phi and \\varphi characters around. There are quite a few boxes and empty spaces here - Luxor/Cairo doesn't invoke the fallback mehanism that you see (but might not notice) in browsers and editors, so if the font doesn't have the character you'll see a box rather than a replacement from another font."

# ╔═╡ Cell order:
# ╟─16139366-454f-11ec-2bdf-09e961bede61
# ╟─073e295b-cef3-47e4-8a52-c8459855ff8d
# ╠═0260aa1d-d487-4f21-af11-752b4409a458
# ╟─f693c61e-5c5e-4e09-9252-49a35b8f5ba3
# ╠═6afdbbba-3d22-4448-8a9a-6d5f4eb431e7
# ╟─ff137e6c-d068-4feb-a20e-b8f6f5d379a2
# ╟─bb0d519b-45ea-4640-b0f2-adc4498f3b21
# ╟─c5168def-a61a-4fd5-9354-c410e11a1645
# ╟─72a415ad-a694-4cd5-9726-4257b88874a8
# ╠═ecbda36f-a6a4-4ad9-a0b6-7b5d2124eb08
# ╟─5f9c2445-d749-4e96-9a92-8b51f4ba20ce
