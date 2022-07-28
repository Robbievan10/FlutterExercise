import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../dependency_injection/injector.dart';
import '../bloc/bloc.dart';
import '../bloc/bloc_provider.dart';

abstract class BaseState<T extends StatefulWidget, K extends Bloc>
    extends State<T> {
  K? bloc;
  late AppLocalizations appLocalizations;

  @override
  void initState() {
    super.initState();
    bloc = Provider.of<K>(() => getIt.get<K>());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  void dispose() {
    Provider.dispose<K>();
    super.dispose();
  }
}
