//
//  MatchstickGridView.swift
//  AnotadorTruco
//
//  Created by Sebastian Yanni on 22/07/2024.
//

import SwiftUI

struct MatchstickGridView: View {
    let points: Int

    var body: some View {
        VStack {
            ForEach(0..<(points / 5 + (points % 5)), id: \.self) { index in
                if index == 3 && points > 15 {
                    Divider()
                        .frame(height: 2)
                        .background(Color.gray)
                        .padding(.vertical, 10)
                }
                MatchstickGroupViewModel(count: min(points - index * 5, 5))
                    .padding(5)
            }
        }
    }
}

#Preview {
    MatchstickGridView(points: 16)
}


/*
•    0..<(points / 5 + (points % 5 > 0 ? 1 : 0)) es el rango de la iteracion.
•    (points / 5) calcula cuantos grupos completos de 5 fosforos hay.
•    (points % 5 > 0 ? 1 : 0) agrega 1 al numero total de grupos si hay un residuo al dividir los puntos por 5 (es decir, si hay fósforos sobrantes que no forman un grupo completo de 5).
•    La combinacion de ambos (points / 5 + (points % 5 > 0 ? 1 : 0)) asegura que se itere sobre todos los grupos completos y un grupo adicional si hay fosforos sobrantes.


•    if index == 3 && points > 15 verifica si estamos en el cuarto grupo (índice 3) y si los puntos son mayores de 15.
•    Si ambas condiciones se cumplen, se inserta un Divider (una línea divisoria) en la vista. Esta línea divisoria se utiliza para separar visualmente los primeros 15 fósforos de los siguientes.
*/

/*
 •    MatchstickGroupView(count: min(points - index * 5, 5)) crea una vista MatchstickGroupView para mostrar un grupo de fósforos.
 •    count: min(points - index * 5, 5) calcula cuántos fósforos debe mostrar el grupo actual.
 •    points - index * 5 calcula cuántos fósforos quedan después de los grupos completos ya mostrados.
 •    min(points - index * 5, 5) asegura que no se muestren más de 5 fósforos en un grupo.
 */
