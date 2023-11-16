import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:umoja_v1/common/widget/error.dart';
import 'package:umoja_v1/common/widget/loader.dart';
import 'package:umoja_v1/features/select_contact/controller/select_contact_controller.dart';

final selectedGroupContact = StateProvider<List<Contact>>((ref) => []);

class SelectContactsGroup extends ConsumerStatefulWidget {
  const SelectContactsGroup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectContactsGroupState();
}

class _SelectContactsGroupState extends ConsumerState<SelectContactsGroup> {
  List<int> selectedContactIndex = [];

  void selecteContact(int index, Contact contact) {
    if (selectedContactIndex.contains(index)) {
      selectedContactIndex.removeAt(index);
    } else {
      selectedContactIndex.add(index);
    }
    setState(() {});
    // ignore: deprecated_member_use
    ref.read(selectedGroupContact.state).update((state) => [...state, contact]);
  }

  @override
  Widget build(BuildContext context) {
    return  ref.watch(getContactsProvider).when(
        data: (contactList) =>Container(
          color: Theme.of(context).colorScheme.background,
          child: SizedBox(
            height: MediaQuery.of(context).size.height/2,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                final textColor = Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                );
                final iconColor = Theme.of(context).colorScheme.background;
                final contact = contactList[index];
                return InkWell(
                  onTap: () => selecteContact(index, contact),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: ListTile(
                        title: Text(
                          contact.displayName,
                          style: textColor
                        ),
                        leading: selectedContactIndex.contains(index)
                            ? IconButton(
                                onPressed: () {},
                                icon:  Icon(Icons.done,color: iconColor,))
                            : null),
                  ),
                );
              },
            ),
          )
        ),
           error: (error, trace) => ErrorScreen(error: error.toString()),
        loading: () => const Loader());
      
        
  }
}
