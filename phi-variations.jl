using DataFrames

df = DataFrame(udec=Int64[], uhex=String[], glyph=String[], lx=String[], desc=String[])

for i in (
    [0x00278, "ɸ", "\\ltphi", "Latin Small Letter Phi"] ,
    [0x003C6, "φ", "\\varphi", "Greek Small Letter Phi"] ,
    [0x003D5, "ϕ", "\\phi", "Greek Phi Symbol / Greek Small Letter Script Phi"] ,
    [0x01D60, "ᵠ", "\\^phi", "Modifier Letter Small Greek Phi"] ,
    [0x01D69, "ᵩ", "\\_phi", "Greek Subscript Small Letter Phi"] ,
    [0x1D6D7, "𝛗", "\\bfvarphi", "Maths Bold Small Phi"] ,
    [0x1D6DF, "𝛟", "\\bfphi", "Maths Bold Phi Symbol"] ,
    [0x1D711, "𝜑", "\\itphi", "Maths Italic Small Phi"] ,
    [0x1D719, "𝜙", "\\itvarphi", "Maths Italic Phi Symbol"] ,
    [0x1D74B, "𝝋", "\\biphi", "Maths Bold Italic Small Phi"] ,
    [0x1D753, "𝝓", "\\bivarphi", "Maths Bold Italic Phi Symbol"] ,
    [0x1D785, "𝞅", "\\bsansphi", "Maths Sans-Serif Bold Small Phi"] ,
    [0x1D78D, "𝞍", "\\bsansvarphi", "Maths Sans-Serif Bold Phi Symbol"] ,
    [0x1D7BF, "𝞿", "\\bisansphi", "Maths Sans-Serif Bold Italic Small Phi"] ,
    [0x1D7C7, "𝟇", "\\bisansvarphi", "Maths Sans-Serif Bold Italic Phi Symbol"])
    push!(df, (i[1], string(i[1], base=16), string(Char(i[1])), i[3], i[4]))
end

# using REPL, PrettyTables
# for lc in df.latexcompletion
#     println("Type ", lc, " to get ", REPL.REPLCompletions.latex_symbols[lc])
# end

show(df[:, [5, 4, 3, 2]], summary=false, allrows = true, allcols=true, truncate=50)
