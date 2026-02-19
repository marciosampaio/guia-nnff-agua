# Potenciais Interatômicos de Aprendizado de Máquina: Um Guia Computacional 💧🤖

[![DeepMD-kit](https://img.shields.io/badge/DeepMD--kit-v2.2-blue)](https://github.com/deepmodeling/deepmd-kit)
[![LAMMPS](https://img.shields.io/badge/LAMMPS-Compatible-green)](https://www.lammps.org/)

Este repositório contém o material suplementar, códigos e tutoriais práticos referentes ao capítulo **"Potenciais Interatômicos de Aprendizado de Máquina: Um Guia Computacional"**, publicado nos anais do [Nome do Evento/Livro]. 

O objetivo deste material é fornecer um guia prático ("*hands-on*") para a construção de um Campo de Força de Rede Neural (NNFF) para a água líquida, utilizando o método *Deep Potential* implementado no pacote computacional **DeepMD-kit**, e sua posterior aplicação em simulações de Dinâmica Molecular usando o **LAMMPS**.

## 👥 Autores
* **Tainá C. Alves** - [Instituição da Tainá]
* **Márcio S. Gomes-Filho** - [Sua Instituição]

---

## 📂 Estrutura do Repositório

O fluxo de trabalho está dividido em três etapas lógicas, refletindo a metodologia discutida no texto principal:

* `01_dft_data/`: Contém os *scripts* e parâmetros utilizados para a geração dos dados de referência *ab initio* (Teoria do Funcional da Densidade).
* `02_deepmd_train/`: Contém os *scripts* de conversão de dados, o arquivo de configuração `input.json` e os arquivos necessários para treinar a rede neural.
* `03_lammps_md/`: Contém o *script* de *input* do LAMMPS (`in.water`) configurado para utilizar o potencial gerado (`graph.pb`), bem como *scripts* de análise (Python/Bash) para extrair propriedades estruturais e dinâmicas (ex: Função de Distribuição Radial).

## ⚙️ Pré-requisitos e Instalação

Para reproduzir este tutorial, você precisará de um ambiente Linux (testado em distribuições como Ubuntu/Mint) com os seguintes pacotes instalados:

* [Anaconda](https://www.anaconda.com/) ou Miniconda
* [DeepMD-kit](https://github.com/deepmodeling/deepmd-kit) (CPU ou GPU)
* [LAMMPS](https://docs.lammps.org/Manual.html) compilado com suporte ao pacote `USER-DEEPMD`
* Python 3.x (Bibliotecas: `numpy`, `matplotlib`, `dpdata`)

Recomendamos a instalação via `conda` para facilitar o gerenciamento de dependências:

```bash
conda create -n deepmd-env dp-vari -c deepmodeling
conda activate deepmd-env
