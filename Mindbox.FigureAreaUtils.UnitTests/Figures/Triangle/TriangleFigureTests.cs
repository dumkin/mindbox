using Mindbox.FigureAreaUtils.Base.Units;
using Mindbox.FigureAreaUtils.Fabric;
using Mindbox.FigureAreaUtils.Figures.Triangle;
using Xunit;

namespace Mindbox.FigureAreaUtils.UnitTests.Figures.Triangle;

public class TriangleFigureTests
{
    [Theory]
    [InlineData(3, 4, 5, 6)]
    public void Area(double sideA, double sideB, double sideC, double expected)
    {
        var figure = new TriangleByThreeSidesFigure(sideA, sideB, sideC);
        var processor = ProcessorChooser.Choose(figure);

        if (processor is IAreaUnit areaUnit)
        {
            var area = areaUnit.Area();

            Assert.Equal(expected, area);
        }

        Assert.IsType<TriangleProcessor>(processor);
    }

    [Theory]
    [InlineData(5, 4, 10, false)]
    [InlineData(4.5, 6, 7.5, true)]
    [InlineData(5, 5, 5, false)]
    public void IsRight(double sideA, double sideB, double sideC, bool expected)
    {
        var figure = new TriangleByThreeSidesFigure(sideA, sideB, sideC);
        var processor = ProcessorChooser.Choose(figure);

        if (processor is IRightUnit rightUnit)
        {
            var isRight = rightUnit.IsRight();

            Assert.Equal(expected, isRight);
        }

        Assert.IsType<TriangleProcessor>(processor);
    }
}