export type Department = {
  head?: string;
};

export const Assistant: Department = {
  // "Assistant" is not the head of its own department, as otherwise
  // it would show as large and bold.
};

export const Nobility: Department = {
  head: "Expedition Leader",
};

export const Institute: Department = {
  head: "High Sycophant",
};

export const Contractors: Department = {
  head: "Expedition Leader",
};

export const Laborers: Department = {
  head: "Expedition Leader",
};
