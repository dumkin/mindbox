using Mindbox.FigureAreaUtils.Base;

namespace Mindbox.FigureAreaUtils.Figures.Triangle;

public record struct TriangleByThreeSidesFigure(double SideA, double SideB, double SideC) : IFigure
{
    public double SideA { get; } = SideA;
    public double SideB { get; } = SideB;
    public double SideC { get; } = SideC;
}