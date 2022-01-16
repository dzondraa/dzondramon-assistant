$s = "Special String Again-12 minutes ago
Jumping on the Clouds-a month ago
Strings: Making Anagrams-a month ago
Merge Sort: Counting Inversions-a month ago
Sales by Match-a month ago
Fraudulent Activity Notifications-a month ago
Sorting: Comparator-a month ago
Simple Array Sum-a month ago
Sorting: Bubble Sort-a month ago
Frequency Queries-a month ago
Hash Tables: Ransom Note-a month ago
Count Triplets-a month ago
Sherlock and Anagrams-a month ago
Arrays: Left Rotation-a month ago
Minimum Swaps 2-a month ago
Plus Minus-a month ago
Candies-4 months ago
Mark and Toys-4 months ago
Recursive Digit Sum-4 months ago
Recursion: Davis' Staircase-4 months ago
New Year Chaos-4 months ago
Max Array Sum -9 months ago
Migratory Birds-9 months ago
Print the Elements of a Linked List-a year ago
Array Manipulation-a year ago
Sparse Arrays-a year ago
Left Rotation-a year ago
2D Array - DS-a year ago
BFS: Shortest Reach in a Graph-2 years ago
The Power Sum-2 years ago
Two Strings-2 years ago
Game of Thrones - I-2 years ago
Sherlock and the Valid String-2 years ago
Making Anagrams-2 years ago
Anagram-2 years ago
KnightL on a Chessboard-2 years ago
Palindrome Index-2 years ago
The Love-Letter Mystery-2 years ago
Ice Cream Parlor-2 years ago
Beautiful Binary String-2 years ago
Alternating Characters -2 years ago
Separate the Numbers-2 years ago
Weighted Uniform Strings-2 years ago
Find the Median-2 years ago
Closest Numbers-2 years ago
Snakes and Ladders: The Quickest Way Up-2 years ago
Pangrams-2 years ago
Gemstones-2 years ago
Funny String-2 years ago
Prim's (MST) : Special Subtree-2 years ago
Kruskal (MST): Really Special Subtree-2 years ago
Even Tree-2 years ago
Gridland Metro-2 years ago
Breadth First Search: Shortest Reach-2 years ago
Sherlock and Array-2 years ago
The Full Counting Sort-2 years ago
Counting Sort 2-2 years ago
Counting Sort 1-2 years ago
Quicksort 1 - Partition-2 years ago
HackerRank in a String!-2 years ago
Mars Exploration-2 years ago
Caesar Cipher-2 years ago
Two Characters-2 years ago
Running Time of Algorithms-2 years ago
Correctness and the Loop Invariant-2 years ago
Insertion Sort - Part 2-2 years ago
Strong Password-2 years ago
Missing Numbers-2 years ago
Marc's Cakewalk-2 years ago
Insertion Sort - Part 1-2 years ago
CamelCase-2 years ago
Apple and Orange-2 years ago
Solve Me First-2 years ago
";

$result = "";
$sArr = $s.Split([Environment]::NewLine);
$count = 0;
foreach ($oneString in $sArr) {

    $oneStringArr = $oneString.Split("-");
    $oneStringArr[$oneStringArr.Length - 1] = "";
    $oneString = $oneStringArr -join "";
    $oneString
    

    if($oneString -ne ""){
        $result += "- " + $oneString + [Environment]::NewLine;
        $count++;
    }
    
}

$result | clip;
Write-Output "Total count: " + $count; 


