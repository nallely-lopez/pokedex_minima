import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../services/pokeapi_service.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final _controlador = TextEditingController();
  Future<Pokemon>? _futuroPokemon;

  void _buscar() {
    final texto = _controlador.text.trim();
    if (texto.isEmpty) return;
    setState(() {
      _futuroPokemon = obtenerPokemon(texto);
    });
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex mínima')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controlador,
              decoration: const InputDecoration(
                labelText: 'Nombre o número del Pokémon',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _buscar(),
            ),
            const SizedBox(height: 12),
            FilledButton(onPressed: _buscar, child: const Text('Buscar')),
            const SizedBox(height: 24),
            Expanded(
              child: _futuroPokemon == null
                  ? const Center(
                      child: Text('Escribe un nombre y presiona Buscar'),
                    )
                  : FutureBuilder<Pokemon>(
                      future: _futuroPokemon,
                      builder: (context, snapshot) {
                        // INICIO TODO 3
                        // TODO 3: mostrar carga, error y éxito
                        return const Center(child: Text('TODO 3'));
                        // FIN TODO 3
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
