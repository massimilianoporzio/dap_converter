const Map<String, Map<String, double>> conversionFactors = {
  "Gycm²": {
    "Gy•cm²": 1.0,
    "mGy•cm²": 1000.0,
    "cGy•cm²": 100.0,
    "dGy•cm²": 10.0,
    "µGy•m²": 100.0,
    "mGy•m²": 0.1,
    "Gy•m²": 0.0001,
  },
  "mGycm²": {
    "mGy•cm²": 1.0,
    "Gy•cm²": 0.001,
    "cGy•cm²": 0.1,
    "dGy•cm²": 0.01,
    "µGy•m²": 0.1,
    "mGy•m²": 0.0001,
    "Gy•m²": 1e-7,
  },
  "cGycm²": {
    "cGy•cm²": 1.0,
    "mGy•cm²": 10,
    "Gy•cm²": 0.01,
    "dGy•cm²": 0.1,
    "µGy•m²": 1.0,
    "mGy•m²": 0.001,
    "Gy•m²": 0.000001,
  },
  "dGycm²": {
    "mGy•cm²": 100,
    "cGy•cm²": 10,
    "dGy•cm²": 1.0,
    "Gy•cm²": 0.1,
    "µGy•m²": 10.0,
    "mGy•m²": 0.01,
    "Gy•m²": 0.00001,
  },
  "µGym²": {
    "mGy•cm²": 10,
    "cGy•cm²": 1.0,
    "dGy•cm²": 0.1,
    "Gy•cm²": 0.01,
    "uGym2": 1.0,
    "mGym2": 0.001,
    "Gym2": 0.000001,
  },
  "mGym2": {
    "mGycm2": 10000,
    "cGycm2": 1000,
    "dGycm2": 100,
    "Gycm2": 10,
    "uGym2": 1000,
    "mGym2": 1,
    "Gym2": 0.001,
  },
  "Gym2": {
    "mGycm2": 10000000,
    "cGycm2": 1000000,
    "dGycm2": 100000,
    "Gycm2": 10000,
    "uGym2": 1000000,
    "mGym2": 1000,
    "Gym2": 1,
  },
};

class DapUnit {
  String value;
  String description;

  DapUnit({this.value = "none", this.description = "none"});
}

List<DapUnit> listaFromUnits = [
  DapUnit(value: 'Gy•cm', description: 'Gy•cm²'),
  DapUnit(value: 'mGy•cm²', description: 'mGy•cm²'),
  DapUnit(value: 'cGy•cm²', description: 'cGy•cm²'),
  DapUnit(value: 'dGy•cm²', description: 'dGy•cm²'),
  DapUnit(value: 'µGy•m²', description: 'µGy•m²'),
  DapUnit(value: 'mGy•m²', description: 'mGy•m²'),
  DapUnit(value: 'Gy•m²', description: 'Gy•m²')
];

List<DapUnit> listaToUnits = [
  DapUnit(value: 'µGy•m²', description: 'µGy•m²'),
  DapUnit(value: 'mGy•cm²', description: 'mGy•cm²'),
  DapUnit(value: 'cGy•cm²', description: 'cGy•cm²'),
  DapUnit(value: 'dGy•cm²', description: 'dGy•cm²'),
  DapUnit(value: 'Gy•cm²', description: 'Gy•cm²'),
  DapUnit(value: 'mGy•m²', description: 'mGy•m²'),
  DapUnit(value: 'Gy•m²', description: 'Gy•m²')
];
