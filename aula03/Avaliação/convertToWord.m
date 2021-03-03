
function palavra = convertToWord(arr)
    char = ['a','m','o','r','.'];
    palavra = "";
    for n = arr(1:end-1)
       palavra = palavra + char(n); 
    end
end

