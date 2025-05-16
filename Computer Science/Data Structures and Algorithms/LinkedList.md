## Linked List
- A collection of ordered items, so it's similar to a normal list ('also called an array or slice in another language').
- A linked list is where elements are not stored to each other in memory, instead, each item references the next in a chain.

- ![image](https://github.com/user-attachments/assets/fbc5e8a6-4e7b-453c-91bb-292d2e449426)

![image](https://github.com/user-attachments/assets/8888f43f-d11b-4f43-9ef6-3c7805a18f18)

- Items in a 'normal' list are stored next to each other in memory.
- To get an item a normal list, we have to use a 'numbered' index.
- Think of a numbered index as an offset from the start.


- In a Linked List there are no indexes! Each node contains two things: the **data** itself and the **reference** to the next node in the list.
- Iterating over a linked list requires starting at the head node and following the next reference until you reach the end.
- Why use linked list?
  - Because it is faster in inserting/deleting items in the middle of the list than normal list.
  - In normal list, if you insert an item in the middle, you have to shift all the items after it down one spot which takes O(n) time.

![image](https://github.com/user-attachments/assets/b3de4bd2-b21e-42ee-852b-8de73fbc6546)

![image](https://github.com/user-attachments/assets/58235da5-cecf-4b9e-979b-048b5419032b)
