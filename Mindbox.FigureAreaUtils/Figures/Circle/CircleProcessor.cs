using Mindbox.FigureAreaUtils.Base;
using Mindbox.FigureAreaUtils.Base.Units;

namespace Mindbox.FigureAreaUtils.Figures.Circle;

public class CircleProcessor : IProcessor, IAreaUnit
{
    public CircleProcessor(CircleByRadiusFigure data)
    {
        Radius = data.Radius;
    }

    private double Radius { get; }

    public double Area()
    {
        return Math.PI * Math.Pow(Radius, 2);
    }
}