const Map<String, Map<String, double>> conversionFactors = {
  "Gy•cm²": {
    "Gy•cm²": 1.0,
    "mGy•cm²": 1000.0,
    "cGy•cm²": 100.0,
    "dGy•cm²": 10.0,
    "µGy•m²": 100.0,
    "mGy•m²": 0.1,
    "Gy•m²": 0.0001,
  },
  "mGy•cm²": {
    "mGy•cm²": 1.0,
    "Gy•cm²": 0.001,
    "cGy•cm²": 0.1,
    "dGy•cm²": 0.01,
    "µGy•m²": 0.1,
    "mGy•m²": 0.0001,
    "Gy•m²": 1e-7,
  },
  "cGy•cm²": {
    "cGy•cm²": 1.0,
    "mGy•cm²": 10,
    "Gy•cm²": 0.01,
    "dGy•cm²": 0.1,
    "µGy•m²": 1.0,
    "mGy•m²": 0.001,
    "Gy•m²": 0.000001,
  },
  "dGy•cm²": {
    "mGy•cm²": 100,
    "cGy•cm²": 10,
    "dGy•cm²": 1.0,
    "Gy•cm²": 0.1,
    "µGy•m²": 10.0,
    "mGy•m²": 0.01,
    "Gy•m²": 0.00001,
  },
  "µGy•m²": {
    "mGy•cm²": 10,
    "cGy•cm²": 1.0,
    "dGy•cm²": 0.1,
    "Gy•cm²": 0.01,
    "µGy•m²": 1.0,
    "mGy•m²": 0.001,
    "Gy•m²": 0.000001,
  },
  "mGy•m²": {
    "mGy•cm²": 10000,
    "cGy•cm²": 1000,
    "dGy•cm²": 100,
    "Gy•cm²": 10,
    "µGy•m²": 1000,
    "mGy•m²": 1,
    "Gy•m²": 0.001,
  },
  "Gy•m²": {
    "mGy•cm²": 10000000,
    "cGy•cm²": 1000000,
    "dGy•cm²": 100000,
    "Gy•cm²": 10000,
    "µGy•m²": 1000000,
    "mGy•m²": 1000,
    "Gy•m²": 1,
  },
};

class DapUnit {
  String value;
  String description;

  DapUnit({this.value = "none", this.description = "none"});
}

List<DapUnit> listaFromUnits = [
  DapUnit(value: 'Gy•cm²', description: 'Gy•cm²'),
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
