// Markdown to HTML: 1) Headerify 2) Boldify 3) Italicize
function headerify(string) {

    // 1. Headerify
    // Finding indices of the 2 "+" signs (bcs the header will be the text in-between the + signs)
    plusIndex1 = 0;
    i = 0;
    var S = string;
    for (i == 0 ; i<= S.length; i++) {
        if (S[i] == '+') {
            plusIndex1 = i;
            break;
        }
    }

    plusIndex2 = 0;
    i = plusIndex1 +1;
    for (i==plusIndex1 +1 ; i<=S.length; i++) {
        if(S[i] == '+') {
            plusIndex2 = i;
            break;
        }
    }

    // Retrieving the header text (between the 2 "+" signs)
    concatString= "";    // Initiating empty string and then using loop to concatenate one character at a time
    i = plusIndex1 +1;
    for (i==plusIndex1 +1 ; i<plusIndex2 ; i++) {
        concatString = concatString + S[i];     
    }

    // Formatting header text into <h1>
    headerified = "<h1>" + concatString + "</h1>";

    return headerified;
}
function boldify(string) {

    // Finding indices of the 2 "*" signs (bcs the header will be the text in-between the * signs)
    plusIndex1 = 0;
    i = 0;
    var S = string;
    for (i == 0 ; i<= S.length; i++) {
        if (S[i] == '*' && S[i+1]== '*') {
            plusIndex1 = i+1;
            break;
        }
    }

    plusIndex2 = 0;
    i = plusIndex1 +1;
    for (i==plusIndex1 +1 ; i<=S.length; i++) {
        if(S[i] == '*' && S[i+1] == '*') {
            plusIndex2 = i;
            break;
        }
    }

    // Retrieving the header text (between the 2 "*" signs)
    concatString= "";    // Initiating empty string and then using loop to concatenate one character at a time
    i = plusIndex1 +1;
    for (i==plusIndex1 +1 ; i<plusIndex2 ; i++) {
        concatString = concatString + S[i];     
    }

    // Formatting header text into <h1>
    boldified = "<strong>" + concatString + "</strong>";

    return boldified;
}
function italicise(string) {

    // Finding indices of the 2 "*" signs (bcs the italic will be the text in-between the + signs)
    plusIndex1 = 0;
    i = 0;
    var S = string;
    for (i == 0 ; i<= S.length; i++) {
        if (S[i] == '*') {
            plusIndex1 = i;
            break;
        }
    }

    plusIndex2 = 0;
    i = plusIndex1 +1;
    for (i==plusIndex1 +1 ; i<=S.length; i++) {
        if(S[i] == '*') {
            plusIndex2 = i;
            break;
        }
    }

    // Retrieving the italic text (between the 2 "*" signs)
    concatString= "";    // Initiating empty string and then using loop to concatenate one character at a time
    i = plusIndex1 +1;
    for (i==plusIndex1 +1 ; i<plusIndex2 ; i++) {
        concatString = concatString + S[i];     
    }

    // Formatting the italic text into <h1>
    italicised = "<i>" + concatString + "</i>";

    return italicised;
}