import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/bubble/bubble_sort.dart';
import 'package:visualizer/bubble/bubble_sort_widget.dart';
import 'package:visualizer/insertion/insertion_sort.dart';
import 'package:visualizer/insertion/insertion_sort_widget.dart';
import 'package:visualizer/merge/merge_sort.dart';
import 'package:visualizer/merge/merge_sort_widget.dart';
import 'package:visualizer/selection/selection_sort.dart';
import 'package:visualizer/selection/selection_sort_widget.dart';

enum Sorting { Merge, Insertion, Selection, Bubble }

class SortHolder extends ChangeNotifier {
  SortHolder() : super();

  final _sortingSet = <Sorting>{};

  Set<Sorting> get sortingSet => _sortingSet;

  bool contains(Sorting type) => sortingSet.contains(type);

  void switchSorting(Sorting type) {
    if (_sortingSet.contains(type)) {
      _sortingSet.remove(type);
    } else {
      _sortingSet.add(type);
    }
    notifyListeners();
  }

  List<Widget> generateWidgets(BuildContext context) {
    final list = <Widget>[];
    for (final Sorting type in _sortingSet) {
      switch (type) {
        case Sorting.Merge:
          list.add(MergeSortWidget());
          break;
        case Sorting.Bubble:
          list.add(BubbleSortWidget());
          break;
        case Sorting.Insertion:
          list.add(InsertionSortWidget());
          break;
        case Sorting.Selection:
          list.add(SelectionSortWidget());
          break;
      }
    }
    return list;
  }

  void shuffleData(BuildContext context) {
    for (final Sorting type in _sortingSet) {
      switch (type) {
        case Sorting.Merge:
          Provider.of<MergeSort>(context, listen: false).generateData();
          break;
        case Sorting.Bubble:
          Provider.of<BubbleSort>(context, listen: false).generateData();
          break;
        case Sorting.Insertion:
          Provider.of<InsertionSort>(context, listen: false).generateData();
          break;
        case Sorting.Selection:
          Provider.of<SelectionSort>(context, listen: false).generateData();
          break;
      }
    }
  }

  void startSorting(BuildContext context) {
    for (final Sorting type in _sortingSet) {
      switch (type) {
        case Sorting.Merge:
          Provider.of<MergeSort>(context, listen: false).startSorting();
          break;
        case Sorting.Bubble:
          Provider.of<BubbleSort>(context, listen: false).startSorting();
          break;
        case Sorting.Insertion:
          Provider.of<InsertionSort>(context, listen: false).startSorting();
          break;
        case Sorting.Selection:
          Provider.of<SelectionSort>(context, listen: false).startSorting();
          break;
      }
    }
  }
}