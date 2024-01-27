import 'package:flutter/material.dart';
import 'package:truth_and_dare/model/category.dart';
import 'package:truth_and_dare/utils/colors.dart';
import 'package:truth_and_dare/widgets/button.dart';

class SelectCategoriesPage extends StatefulWidget {
  const SelectCategoriesPage({super.key});

  @override
  State<SelectCategoriesPage> createState() => _SelectCategoriesPageState();
}

class _SelectCategoriesPageState extends State<SelectCategoriesPage> {
  int _selectedCategoryIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: AppColor.whiteColor,
        title: const Text(
          'Select Pack',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              itemBuilder: ((context, index) {
                final bool isSelected = index == _selectedCategoryIndex;
                return Ink(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: AppColor.secondaryColor.withOpacity(0.3),
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    child: _buildCategoryListItem(category: categories[index], isSelected: isSelected),
                  ),
                );
              }),
              separatorBuilder: ((context, index) => const SizedBox(height: 32)),
              itemCount: categories.length,
            ),
          ),
          if (_selectedCategoryIndex != -1)
             Positioned(
              bottom: 32,
              left: 16,
              right: 16,
              child: PrimaryButton(
                buttonText: 'Continue',
                buttonBackgroundColor: AppColor.whiteColor,
                textColor: AppColor.primaryColor,
                onButtonTap: () {
                  final Category selectedCategory = categories.firstWhere((element) => element.id == _selectedCategoryIndex);
                  Navigator.of(context).pop(selectedCategory);
                },
              ),
            )
        ],
      ),
    );
  }

  Widget _buildCategoryListItem({
    required Category category,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: AppColor.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColor.accentColor : Colors.transparent,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 64,
            height: 64,
            child: Image.asset(
              category.getIconPath(),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.type,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${category.truths.length} truth, ${category.dares.length} dares are available.',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColor.whiteColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
