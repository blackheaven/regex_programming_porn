def r(i)
    # i.scan(/
    #            \b(?:[\w_][\w_\d]*)\b(?<!if|else|while|for|return)
    #            \s*
    #            \b([\w_][\w_\d]*)\b(?!\s*\()(?!.*\b\1\b)
    #        /xm)
    i.scan(/\b(?:[\w_][\w_\d]*)\b(?<!if|else|while|for|return)\s*\b([\w_][\w_\d]*)\b(?!\s*\()(?!.*\b\1\b)/)
end

describe 'regex' do
    context 'should find nothing' do
        it 'main empty' do
            r('int main (void){return 0;}').should == []
        end
        it 'square' do
            r('int s(int n){return n*n;}').should == []
        end
        it 'dummy' do
            r('int d(){int g = 42; int h = 24; int i = 10; i = g*h;}').should == []
        end
    end
    context 'should find something' do
        it 'main empty' do
            r('int main (void){int a; return 0;}').should == [["a"]]
        end
        it 'square' do
            r('int s(int n){return;}').should == [["n"]]
        end
        it 'dummy' do
            r('int d(){int g = 42; int h = 24; int i = 10;}').should == [["g"], ["h"], ["i"]]
        end
    end
end
