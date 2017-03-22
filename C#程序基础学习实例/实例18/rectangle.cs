using System;

class Rectangle
{
  private int iHeight;
  private int iWidth;

  // ȱʡ���캯�� 
  public Rectangle()
  {
    Height=0;
    Width=0;
  }

  // ���캯������
  public Rectangle(int w,int h)
  {
    Width=w;
    Height=h;
  }

  // ���ԣ��� ��get��set������
  public int Width
  {
    get
    {
      return iWidth;
    }
    set
    {
      iWidth=value;
    }
  }

  // ���ԣ��� ��get��set������
  public int Height
  {
    get
    {
      return iHeight;
    }
    set
    {
      iHeight=value;
    }
  }

  // ���ԣ���� ��get������
  public int Area   
  {
    get
    {
      return Height*Width;
    }
  }

  // ���ز����� == 
  public static bool operator==(Rectangle a,Rectangle b)
  {
    return ((a.Height==b.Height)&&(a.Width==b.Width));
  }

  // ���ز����� != 
  public static bool operator!=(Rectangle a,Rectangle b)
  {
    return !(a==b);
  }

  // ���ز����� >
  public static bool operator>(Rectangle a,Rectangle b)
  {
    return a.Area>b.Area;
  }

  // ���ز����� <
  public static bool operator<(Rectangle a,Rectangle b)
  {
    return !(a>b);
  }

  // ���ز����� >=
  public static bool operator>=(Rectangle a,Rectangle b)
  {
    return (a>b)||(a==b);
  }

  // ���ز����� <=
  public static bool operator<=(Rectangle a,Rectangle b)
  {
    return (a<b)||(a==b);
  }

  // ����ToString
  public override String ToString()
  {
    return "��=" + Height + ",��=" + Width;
  }

  public static void Main()
  {
    // ʵ�����������β����ø�������
    Rectangle objRect1 =new Rectangle();
    Rectangle objRect2 =new Rectangle();
    Rectangle objRect3 =new Rectangle(10,15);
    objRect1.Height=15;
    objRect1.Width=10;
    objRect2.Height=25;
    objRect2.Width=10;

    // ��ӡ�������ε���Ϣ
    // ���е�����ToString����
    Console.WriteLine("����#1 " + objRect1);
    Console.WriteLine("����#2 " + objRect2);
    Console.WriteLine("����#3 " + objRect3);

    // ʹ�����غ�Ĳ������ȽϾ��β���ӡ���
    if(objRect1==objRect2)
    {
      Console.WriteLine("����#1�;���#2�ߺͿ����");
    }
    else
    {
      if(objRect1>objRect2)
      {
        Console.WriteLine("����1���ھ���2");
      }
      else
      {
        Console.WriteLine("����1С�ھ���2");       
      }
    }

    if(objRect1==objRect3)
    {
      Console.WriteLine("����1�;���3�ߺͿ����");
    }
    else
    {
      Console.WriteLine("����1�;���3�����");
    }
  }
}

