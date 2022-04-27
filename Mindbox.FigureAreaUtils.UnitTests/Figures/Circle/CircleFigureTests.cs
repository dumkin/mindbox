using System;
using Mindbox.FigureAreaUtils.Base.Units;
using Mindbox.FigureAreaUtils.Fabric;
using Mindbox.FigureAreaUtils.Figures.Circle;
using Xunit;

namespace Mindbox.FigureAreaUtils.UnitTests.Figures.Circle;

public class CircleFigureTests
{
    [Theory]
    [InlineData(0, 0)]
    [InlineData(1, Math.PI)]
    [InlineData(2, 12.566370614359172)]
    public void Area(double radius, double expected)
    {
        var figure = new CircleByRadiusFigure(radius);
        var processor = ProcessorChooser.Choose(figure);

        if (processor is IAreaUnit areaUnit)
        {
            var area = areaUnit.Area();

            Assert.Equal(expected, area);
        }

        Assert.IsType<CircleProcessor>(processor);
    }
}