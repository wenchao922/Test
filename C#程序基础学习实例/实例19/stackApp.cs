// Stack���ֿռ�
namespace Stack
{
  using System;

  public class Stack
  {
    // first: ջ������һ���ڵ�
    private Node first = null;
    
    // count: ջ�нڵ������
    private int count = 0;

    // �п����ԣ��ṩget������
    public bool Empty
    {
      get
      {
        return (first == null);
      }
    }

    // �������ԣ��ṩget������
    public int Count
    {
    get
    {
      return count;
    }
  }

  // ѹջ������ע�ⷵ��object
  public object Pop()
  {
    if (first == null)
    {
      throw new InvalidOperationException ("Cant pop from an empty stack");
    }
    else
    {
      object temp = first.Value;
      first = first.Next;
      count--;
      return temp;
    }
  }

  // ��ջ���������ؿ�
  public void Push(object o)
  {
    first = new Node(o, first);
    count++;
  }

  // �ڵ���
  class Node
  {
    // �ڵ����������ԣ��Լ���ָ����һ���ڵ�
    public Node Next;
    public object Value;

    public Node(object value) : this(value, null) {}

    public Node(object value, Node next)
    {
      Next = next;
      Value = value;
    }
  }
}

class StackApp
{
  static void Main()
  {
    Stack s = new Stack();

    if (s.Empty)
      Console.WriteLine("��ջΪ��");
    else
      Console.WriteLine("��ջ�ǿ�");

    // ��ջ��ѹ��5���ڵ�
    for (int i = 0; i < 5; i++)
      s.Push(i);

    Console.WriteLine("����ջ��ѹ����{0}��Ԫ��", s.Count);
    
    // ��ջ�нڵ�ȫ��������
    for (int i = 0; i < 5; i++)
      Console.WriteLine("�����˵�{0}��Ԫ�أ���ʣ{1}��Ԫ�ء�", (int)s.Pop()+1, s.Count);

    s = null;
    }
  }
}

