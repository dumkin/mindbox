using Mindbox.FigureAreaUtils.Base;

namespace Mindbox.FigureAreaUtils.Figures.Circle;

public record struct CircleByRadiusFigure(double Radius) : IFigure
{
    public double Radius { get; } = Radius;
}