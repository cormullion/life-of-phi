philist = Array[
["\\textphi",         "LATIN SMALL LETTER PHI"],
["\\Phi",             "GREEK CAPITAL LETTER PHI"],
["\\varphi",          "GREEK SMALL LETTER PHI for Greek text, and Maths prefers this loopy glyph"],
["\\phi",             "GREEK PHI SYMBOL used as a technical symbol, with a stroked glyph"],
["\\^phi",            "MODIFIER LETTER SMALL GREEK PHI"],
["\\_phi",            "GREEK SUBSCRIPT SMALL LETTER PHI"],
["\\^Phi",            "MODIFIER LETTER SMALL PHI"],
["\\mbfPhi",          "MATHEMATICAL BOLD CAPITAL PHI"],
["\\mbfvarphi",       "MATHEMATICAL BOLD SMALL PHI"],
["\\mbfphi",          "MATHEMATICAL BOLD PHI SYMBOL"],
["\\mitPhi",          "MATHEMATICAL ITALIC CAPITAL PHI"],
["\\mitphi",          "MATHEMATICAL ITALIC SMALL PHI"],
["\\mitvarphi",       "MATHEMATICAL ITALIC PHI SYMBOL"],
["\\mbfitphi",        "MATHEMATICAL BOLD ITALIC SMALL PHI"],
["\\mbfitvarphi",     "MATHEMATICAL BOLD ITALIC PHI SYMBOL"],
["\\mbfsansphi",      "MATHEMATICAL SANS-SERIF BOLD SMALL PHI"],
["\\mbfsansvarphi",   "MATHEMATICAL SANS-SERIF BOLD PHI SYMBOL"],
["\\mbfitsansPhi",    "MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL PHI"],
["\\mbfitsansphi",    "MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL PHI"],
["\\mbfitsansvarphi", "MATHEMATICAL SANS-SERIF BOLD ITALIC PHI SYMBOL"]]

begin
    println("Phi", "\t", join(rpad.(["LATEX", "UNICODE", "UNICODE DESCRIPTION"], [20, 10, 100])))
    for (n, s) in enumerate(philist)
        phisymbol = Base.REPLCompletions.latex_symbols[s[1]]
        latexkb = s[1]
        hexchar = hex(Base.REPLCompletions.latex_symbols[s[1]][1])
        unicodename = philist[n][2]
        println(phisymbol, "\t", join(rpad.([latexkb, hexchar, unicodename], [20, 10, 100])))
    end
end
