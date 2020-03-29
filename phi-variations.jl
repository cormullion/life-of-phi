using DataFrames

df = DataFrame(unicodepoint=Int64[], unicodepointhex=String[], unicodechar=String[], latexcompletion=String[], desc=String[])

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

@show df

using REPL

for lc in df[:latexcompletion]
    println("Type ", lc, " to get ", REPL.REPLCompletions.latex_symbols[lc])
end
