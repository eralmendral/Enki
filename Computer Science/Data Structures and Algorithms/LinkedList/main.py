from node import Node

class LinkedList:
  def add_to_tail(self, node):
    if not self.head:
      self.head = node
      return

    lastNode = None
    for current in self:
      lastNode = current

    lastNode.next = node 


  def __init__(self):
    self.head = None

  def __iter__(self):
    node = self.head
    while node:
      yield node
      node = node.next


  def __repr__(self):
     nodes = []
     for node in self:
       nodes.append(node.val)
     return " -> ".join(nodes)
