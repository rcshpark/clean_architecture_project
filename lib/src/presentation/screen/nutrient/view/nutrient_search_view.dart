import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/src/presentation/screen/nutrient/view/nutrient_detail_view.dart';
import 'package:health_care/src/presentation/screen/nutrient/widgets/search_result_widget.dart';
import 'package:health_care/src/presentation/view_model/nutrient/nutrient_view_model.dart';

class NutrientSearchScreen extends ConsumerWidget {
  NutrientSearchScreen({super.key});
  final searchTextController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final nutrientViewModel = ref.read(nutreintViewModel.notifier);
        nutrientViewModel.searchNutrient(searchTextController.text,
            loadMore: true);
      }
    });
    final nutrientState = ref.watch(nutreintViewModel);
    final nutrientViewModel = ref.watch(nutreintViewModel.notifier);
    final addList = ref.watch(nutrientController);
    final hasMoreData = ref.watch(nutreintViewModel.notifier).hasMoreData;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              addList.clear();
              Navigator.pop(context);
            },
          ),
          title: const Text("음식 찾기")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SearchBar(
              controller: searchTextController,
              trailing: [
                IconButton(
                  icon: const Icon(Icons.highlight_remove_sharp),
                  onPressed: () {
                    searchTextController.clear();
                  },
                ),
              ],
              constraints: const BoxConstraints(maxHeight: 45),
              onSubmitted: (query) {
                if (query.isEmpty) return;
                nutrientViewModel.searchNutrient(query);
              },
            ),
            Expanded(
                child: searchBody(nutrientState, context, addList,
                    _scrollController, hasMoreData)),
            if (ref.watch(nutrientController).isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                        "총 칼로리: ${ref.read(nutrientController.notifier).calculateTotalKcal()} kcal"),
                    ElevatedButton(
                        onPressed: () {
                          showNutrientListBottomSheet(context);
                        },
                        child: const Text('자세히')),
                    ElevatedButton(onPressed: () {}, child: const Text('저장'))
                  ],
                ),
              )
            else
              const SizedBox()
          ],
        ),
      ),
    );
  }
}

Widget searchBody(RemoteNutrientState nutrientState, BuildContext context,
    final addList, ScrollController scrollController, final hasMoreData) {
  if (nutrientState is RemoteNutrientInitial) {
    return const Center(child: Text("검색어를 입력하세요"));
  } else if (nutrientState is RemoteNutrientLoading) {
    return const Center(child: CircularProgressIndicator());
  } else if (nutrientState is RemoteNutrientSuccess) {
    return ListView.builder(
      controller: scrollController,
      itemCount: nutrientState.nutrients.length + 1,
      itemBuilder: (context, index) {
        if (index >= nutrientState.nutrients.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Center(
                child: hasMoreData
                    ? const CircularProgressIndicator()
                    : const Text("더 이상 데이터가 없습니다.")),
          ); // 페이지네이션 로딩 바
        }
        final nutrient = nutrientState.nutrients[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) =>
                      NutrientDetailScreen(nutrientModel: nutrient)))),
          child: ListTile(
            title: Text("${nutrient.name} - ${nutrient.company}"),
            subtitle: Text("Calories: ${nutrient.kcal}"),
          ),
        );
      },
    );
  } else if (nutrientState is RemoteNutrientError) {
    return Center(
        child: Text(
            textAlign: TextAlign.center,
            "검색중에 오류가 발생했습니다. \n${nutrientState.message}"));
  } else if (nutrientState is RemoteNutrientError) {
    return Center(
        child: Text(
            textAlign: TextAlign.center,
            "검색중에 오류가 발생했습니다. \n${nutrientState.message}"));
  }
  return const Text("검색 결과가 없습니다.");
}
