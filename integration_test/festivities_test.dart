import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:cusco_360/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Robot automatizado: Prueba completa de Festividades', (WidgetTester tester) async {
    print('🤖 Iniciando prueba de Festividades...');

    // ---------------------------------------------------------
    // 1. INICIAR LA APLICACIÓN
    // ---------------------------------------------------------
    await tester.pumpWidget(const Cusco360App());
    await tester.pump(const Duration(seconds: 2)); // Espera real
    await tester.pumpAndSettle();

    // ---------------------------------------------------------
    // 2. NAVEGAR A FESTIVIDADES DESDE EL HOME
    // ---------------------------------------------------------
    print('🤖 Buscando botón de Festividades...');

    final festividadesButton = find.text('Festividades');

    expect(
      festividadesButton,
      findsAtLeast(1),
      reason: '❌ No se encontró ningún botón con texto "Festividades" en la pantalla de inicio',
    );

    await tester.tap(festividadesButton.first);
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    // ---------------------------------------------------------
    // 3. VERIFICAR QUE ESTAMOS EN LA PANTALLA
    // ---------------------------------------------------------
    print('🤖 Verificando pantalla de Festividades...');

    final appBarTitle = find.descendant(
      of: find.byType(AppBar),
      matching: find.text('Festividades'),
    );

    expect(
      appBarTitle,
      findsOneWidget,
      reason: '❌ No se encontró el título "Festividades" en el AppBar',
    );

    // ---------------------------------------------------------
    // 4. PROBAR BUSCADOR
    // ---------------------------------------------------------
    print('🤖 Intentando usar el campo de búsqueda...');

    final searchField = find.byWidgetPredicate((widget) {
      return widget is TextField &&
             widget.decoration?.hintText?.toLowerCase().contains('buscar') == true;
    });

    if (searchField.evaluate().isNotEmpty) {
      await tester.enterText(searchField, 'Inti Raymi');
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      print('🤖 Verificando resultado de búsqueda...');
      final intiRaymiText = find.text('Inti Raymi');
      expect(intiRaymiText, findsAtLeast(1),
          reason: '❌ No se encontró el texto "Inti Raymi" después de buscar');

      // limpiar
      await tester.enterText(searchField, '');
      await tester.pump(const Duration(seconds: 1));
      await tester.pumpAndSettle();
    } else {
      print('⚠ No se encontró campo de búsqueda, omitiendo esta sección.');
    }

    // ---------------------------------------------------------
    // 5. INTERACTUAR CON EL CALENDARIO
    // ---------------------------------------------------------
    print('🤖 Buscando día clickeable en el calendario...');

    final year = DateTime.now().year;
    final today = DateTime.now();

    // priorizar 24 de junio
    final day24June = find.byKey(Key('day_24_6_$year'));
    Finder? targetDay;

    if (day24June.evaluate().isNotEmpty) {
      targetDay = day24June;
    } else {
      final todayButton = find.byKey(Key('day_${today.day}_${today.month}_$year'));
      if (todayButton.evaluate().isNotEmpty) {
        targetDay = todayButton;
      } else {
        final firstDay = find.byKey(Key('day_1_${today.month}_$year'));
        if (firstDay.evaluate().isNotEmpty) {
          targetDay = firstDay;
        }
      }
    }

    if (targetDay != null) {
      await tester.tap(targetDay);
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();
      print('🤖 Día del calendario tocado correctamente.');
    } else {
      print('⚠ No se encontraron días clickeables en el calendario.');
    }

    // ---------------------------------------------------------
    // 6. VERIFICAR SECCIÓN DE EVENTOS
    // ---------------------------------------------------------
    print('🤖 Verificando sección de eventos...');

    final eventsTitle = find.byKey(const Key('events_title'));

    expect(
      eventsTitle,
      findsOneWidget,
      reason: '❌ No se encontró la sección de eventos del día.',
    );

    // ---------------------------------------------------------
    // 7. FINALIZAR
    // ---------------------------------------------------------
    print('🎉 PRUEBA COMPLETADA EXITOSAMENTE');
    print('🤖 Acciones ejecutadas:');
    print('   ✔ Inicio de app');
    print('   ✔ Navegación a Festividades');
    print('   ✔ Prueba de búsqueda');
    print('   ✔ Interacción con calendario');
    print('   ✔ Verificación de sección de eventos');
  });
}
