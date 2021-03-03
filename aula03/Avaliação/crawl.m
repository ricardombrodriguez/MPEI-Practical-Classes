
% Random walk on the Markov chain
% Inputs:
% H - state transition matrix
% first - initial state
% last - terminal or absorving state

function state = crawl(H, first, last, n)

    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    state = [first];
    % keep moving from state to state until state "last" is reached:
    while(1)
        state(end+1) = nextState(H, state(end));
        if(state(end) == last)
            break;
        else if (length(state) == n)
            break;
        end
    end
end