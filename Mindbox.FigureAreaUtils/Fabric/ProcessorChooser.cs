using Mindbox.FigureAreaUtils.Base;
using Mindbox.FigureAreaUtils.Figures.Circle;
using Mindbox.FigureAreaUtils.Figures.Triangle;

namespace Mindbox.FigureAreaUtils.Fabric;

public static class ProcessorChooser
{
    /// В задании есть пункт:
    ///     "Вычисление площади фигуры без знания типа фигуры в compile-time"
    /// Очень плохо понятно что требуется из этого
    /// Возможно имелось ввиду написание фабрики?
    /// Я решил написать так называемую "простую фабрику"
    public static IProcessor Choose(IFigure figure)
    {
        return figure switch
        {
            CircleByRadiusFigure data => new CircleProcessor(data),
            TriangleByThreeSidesFigure data => new TriangleProcessor(data),
            _ => throw new ArgumentOutOfRangeException(nameof(figure), "Unknown figure type")
        };
    }
}