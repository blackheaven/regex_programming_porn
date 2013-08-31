GC.disable
NB = 1000000

l = []
1.upto(NB) do
    l << /PATTERN/MODIFIER
end

l.each do |r|
    '' =~ r
end
