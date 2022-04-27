using Mindbox.FigureAreaUtils.Base;
using Mindbox.FigureAreaUtils.Base.Units;

namespace Mindbox.FigureAreaUtils.Figures.Triangle;

public class TriangleProcessor : IProcessor, IAreaUnit, IRightUnit
{
    public TriangleProcessor(TriangleByThreeSidesFigure data)
    {
        SideA = data.SideA;
        SideB = data.SideB;
        SideC = data.SideC;
    }

    private double SideA { get; }
    private double SideB { get; }
    private double SideC { get; }

    public double Area()
    {
        var halfPerimeter = (SideA + SideB + SideC) / 2.0;

        return Math.Sqrt(halfPerimeter * (halfPerimeter - SideA) * (halfPerimeter - SideB) * (halfPerimeter - SideC));
    }

    public bool IsRight(double tolerance = 0.0001)
    {
        var hypotenuse = Math.Max(SideA, Math.Max(SideB, SideC));
        var otherSides = new[] { SideA, SideB, SideC }.Where(s => Math.Abs(s - hypotenuse) > tolerance).ToList();

        if (otherSides.Count != 2)
        {
            return false;
        }

        return Math.Abs(Math.Pow(otherSides.First(), 2) + Math.Pow(otherSides.Last(), 2) - Math.Pow(hypotenuse, 2)) < tolerance;
    }
}