using System;

class Area
{
    public class Geometry
    {
        public const double pi = Math.PI;

        protected double r;

        public Geometry()
        {
        }

        public Geometry(double x)
        {
            r = x;
        }

        // �������Ϊ�鷽������������ظ÷���
        public virtual double Area()
        {
            return r * r;
        }
    }

    // Բ
    public class Circle : Geometry
    {
        public Circle(double r) : base(r)
        {
        }

        // �������������
        public override double Area()
        {
            return pi * r * r;
        }
    }

    // ����
    public class Sphere : Geometry
    {
        public Sphere(double r) : base(r)
        {
        }

        // �������������
        public override double Area()
        {
            return 4 * pi * r * r;
        }
    }

    // �ȱ�������
    public class EquilateralTriangle : Geometry
    {
        public EquilateralTriangle(double r) : base(r)
        {
        }

        // �������������
        public override double Area()
        {
            return r * r * Math.Sin(pi/3.0) / 2.0;
        }
    }

    public static void Main()
    {
        double r = 4.0;

        Geometry a = new Geometry(r);
        Geometry c = new Circle(r);
        Geometry s = new Sphere(r);
        Geometry et = new EquilateralTriangle(r);

        Console.WriteLine("r={0}����Ӧ��", r);
        Console.WriteLine("�����ε����Ϊ:{0}", a.Area());
        Console.WriteLine("Բ�����Ϊ:{0}", c.Area());
        Console.WriteLine("����ı����Ϊ:{0}", s.Area());
        Console.WriteLine("�ȱ������ε����Ϊ:{0}", et.Area());
    }
}