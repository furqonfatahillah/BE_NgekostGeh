const { query } = require("../config/db.js");

const getRegisterPencariKos = async (req, res) => {
  const [data] = await query("SELECT * FROM register_pencariKos");
  try {
    res.json({
      message: "GET all users success",
      data: data,
    });
  } catch (error) {
    res.status(500).json({
      message: "Server Error",
      serverMessage: error,
    });
  }
};

const postRegisterPencariKos = async (req, res) => {
  const { Nama, No_Hp, Email, PasswordHash } = req.body;
  if (!Nama || !No_Hp || !Email || !PasswordHash) {
    return res.status(400).json({
      message: "Anda mengirimkan data yang salah",
      data: null,
    });
  }
  try {
    //  prevent SQL injection
    const { id_pencariKos: id } = await query(
      `
          INSERT INTO register_pencariKos (
            Nama, No_Hp, Email, PasswordHash
          ) VALUES (
            ?, ?, ?, ?
          );
        `,
      [Nama, No_Hp, Email, PasswordHash]
    );

    return res.status(200).json({
      message: "Todo added success!",
      data: {
        id_pencariKos: id,
        ...req.body,
      },
    });
  } catch (error) {
    return res
      .status(400)
      .json({ message: `Error creating Kos: ${error.message}` });
  }
};

const deleteRegisterPencariKos = async (req, res) => {
  const { id_pencariKos } = req.params;

  try {
    await query(
      `DELETE  FROM register_pencariKos WHERE id_pencariKos=${id_pencariKos}`
    );
    const [data] = await query("SELECT * FROM register_pencariKos");
    res.json({
      message: "DELETE user success",
      data: data,
    });
  } catch (error) {
    res.status(500).json({
      message: "Server Error",
      serverMessage: error.message,
    });
  }
};

module.exports = {
  postRegisterPencariKos,
  getRegisterPencariKos,
  deleteRegisterPencariKos,
};
