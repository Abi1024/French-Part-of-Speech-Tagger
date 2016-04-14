/* Abiyaz Chowdhury, Andrew Rehayem, French POS tagger. NLP Spring 2016*/

/* Training program
 The states will be represented as strings specified by the French tagset. There will be an array containing the states. 
 Observations will be represented as strings, and stored as an array of strings representing the sentence.
 Transition probabilities is a hashmap that takes state1 and state2 and returns the probability of transitioning from state i to state j.
 Emission probability is a hashmap that takes a state and an observation and returns the probability of that observation given that state.
 
 
 for each (token,tag) in the corpus:
 
 */
PFont myFont;
import java.util.*;
HashMap<String,String > state_space = new HashMap<String,String >();
HashMap<String,Float> start_probability = new HashMap<String,Float>();
HashMap<String,HashMap<String,Float>> transition = new HashMap<String,HashMap<String,Float>>();
HashMap<String,HashMap<String,Float>> emission = new HashMap<String,HashMap<String,Float>>();

void setup(){
  strokeWeight(1);
  size(1000, 800);
  String lines[] = loadStrings("input.txt");
  String previous_state = "";
  for (int i = 0; i < lines.length; i++){
    String words[] = lines[i].split("[\\s+]|:");
    if (words.length >= 2){
       words[0] = words[0].toLowerCase();
       println(words[0] + " " + words[1]);
       if (transition.get(words[1]) == null){
           transition.put(words[1],new HashMap<String,Float>());
       }
       HashMap<String,Float> innerMap = transition.get(words[1]);
       Float count = innerMap.containsKey(words[0]) ? innerMap.get(words[0]) : 0; //update emission count
       transition.get(words[1]).put(words[0], count + 1);
       println (words[0] + " " + words[1] + " " + transition.get(words[1]).get(words[0]));
       if (previous_state != ""){ //update transition count
           if (previous_state == "SENT"){
              start_probability.
              words[0]
           }
       }
       previous_state = words[1];
    }
  }
}

/* Testing program========================================================================================================
 state_space = set of possible states, each state is a string
 observation_space = set of possible observations, each observation is a word
 start probability = returns the probability that a sentence starts with state i
 transition probabilities = given states i and j, returns the probability of going from state i to state j
 emission probabilities = given state j and observation x, returns the probability of x given j.
 
 intermediate_matrix = N*T matrix (N hidden states, time sequence T) giving the intermediate viterbi paths
 backtrace = N*T matrix to store the backtrace path
 
 viterbi: given a sentence, returns the most likely sequence of hidden states
 
 N = number of states, specified during training
 T = sentence length
 sentence is an array of size T, sentence[i] is the ith word in the sentence.
 ba
 
 ===VITERBI PSEUDOCODE===
 for i in range(0,T):
 for j in range(0,N):
 if (i==0): //start probability vector
 intermediate_matrix[i][j] = start_probability[j]*emission(state_space[j],sentence[i])
 else:
 intermediate_matrix[i][j] = 0
 for k in range(0,N):
 if intermediate_matrix[i-1][k]*transition(state_space[k],state_space[j])*emission(state_space[j],sentence[i]) > intermediate_matrix[i][j]:
 intermediate_matrix[i][j] = intermediate_matrix[i-1][k]*transition(state_space[k],state_space[j])*emission(state_space[j],sentence[i])
 backtrace[i][j] = state_space[k]
 max = 0
 index = -1;
 for i in range(0,N):
 if intermediate_matrix[i][T-1] > max:
 max = intermediate_matrix[i][T-1]
 index = i;
 backtrace_path is a stack
 
 k = index;
 for i in range(0,T):
 backtrace_path.push(state_space[k])
 k = backtrace[i][k]
 
 hidden_state_sequence = empty array
 while backtrace_path is not empty:
 hidden_state_sequence.append(backtrace_path.pop());
 
 
 
 */