using System;
using Mindbox.FigureAreaUtils.Base;
using Mindbox.FigureAreaUtils.Fabric;
using Mindbox.FigureAreaUtils.Figures.Circle;
using Mindbox.FigureAreaUtils.Figures.Triangle;
using Xunit;

namespace Mindbox.FigureAreaUtils.UnitTests.Fabric;

public class FabricTests
{
    [Theory]
    [InlineData(typeof(CircleByRadiusFigure), typeof(CircleProcessor))]
    [InlineData(typeof(TriangleByThreeSidesFigure), typeof(TriangleProcessor))]
    public void Choose(Type figureType, Type expected)
    {
        var figure = Activator.CreateInstance(figureType) as IFigure;
        Assert.NotNull(figure);
        var processor = ProcessorChooser.Choose(figure!);

        Assert.IsType(expected, processor);
    }

    [Fact]
    public void ChooseUnknown()
    {
        var figure = new UnknownFigure();

        Assert.Throws<ArgumentOutOfRangeException>(() => ProcessorChooser.Choose(figure));
    }

    private record struct UnknownFigure : IFigure;
}