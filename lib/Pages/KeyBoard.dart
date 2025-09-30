import 'package:flutter/material.dart';

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart'; // <--- 1. Import the package

// --- Main Dialer Screen Widget ---
class Keyboard extends StatefulWidget {
  const Keyboard({super.key});

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  // State variable to hold the number being typed
  String _dialedNumber = '';

  // Function to handle dial pad button press
  void _handleNumberPress(String input) {
    setState(() {
      // Logic to append the pressed number/symbol
      if (_dialedNumber.length < 20) {
        _dialedNumber += input;
      }
    });
  }

  // Function to handle the delete/backspace button press
  void _handleDeletePress() {
    setState(() {
      if (_dialedNumber.isNotEmpty) {
        _dialedNumber = _dialedNumber.substring(0, _dialedNumber.length - 1);
      }
    });
  }

  // 2. New function to handle the actual phone call using url_launcher
 makeCall(String Pnumber) async {
    await FlutterPhoneDirectCaller.callNumber(Pnumber);
  }

  @override
  Widget build(BuildContext context) {
    // Function to build a single button instance
    Widget buildButton(String number, String letters) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _handleNumberPress(number),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            elevation: 0,
            minimumSize: const Size(75.0, 75.0),
            backgroundColor: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.all(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                number,
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              if (letters.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    letters,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withOpacity(0.5),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // --- Phone Number Display Area ---
            const SizedBox(height: 80),
            Text(
              _dialedNumber.isEmpty ? 'Enter a number' : _dialedNumber,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 50),

            // --- 4x3 Circular Dial Pad (Hardcoded Rows) ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Row 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton('1', ''),
                        buildButton('2', 'ABC'),
                        buildButton('3', 'DEF'),
                      ],
                    ),
                    // Row 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton('4', 'GHI'),
                        buildButton('5', 'JKL'),
                        buildButton('6', 'MNO'),
                      ],
                    ),
                    // Row 3
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton('7', 'PRS'),
                        buildButton('8', 'TUV'),
                        buildButton('9', 'WXY'),
                      ],
                    ),
                    // Row 4
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton('*', ''),
                        buildButton('0', '+'),
                        buildButton('#', ''),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // --- Bottom Control Buttons ---
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 30.0,
                left: 32.0,
                right: 32.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // 1. Menu Button
                  Container(width: 56, height: 56),

                  const Spacer(),

                  // 2. Prominent Green Call FAB
                  FloatingActionButton(
                    // 3. Call the new _makeCall function
                    onPressed: (){
                      makeCall(_dialedNumber);
                    },
                    backgroundColor: Colors.green.shade500,
                    elevation: 0,
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),

                  const Spacer(),

                  // 3. Small Delete/Backspace Button
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: IconButton(
                      icon: Icon(
                        Icons.backspace,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.5),
                        size: 30,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: _handleDeletePress,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
