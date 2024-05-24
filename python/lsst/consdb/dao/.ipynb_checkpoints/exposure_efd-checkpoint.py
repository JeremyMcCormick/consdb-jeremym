from dao.base import DBBase
from sqlalchemy.sql import and_, select


class ExposureEfdDao(DBBase):
    def __init__(self, db_uri: str):
        super(ExposureEfdDao, self).__init__(db_uri)

        self.tbl = self.get_table("ExposureEFD")

    def get_by_exposure_id(self, exposure_id: int):

        stm = select(self.tbl.c).where(and_(self.tbl.c.exposure_id == exposure_id))

        rows = self.fetch_one_dict(stm)

        return rows

    def teste(self):

        stm = select(self.tbl.c).limit(10)

        # print(stm)
        rows = self.fetch_all_dict(stm)

        return rows

    def get_asteroids_by_base_dynclass(self, dynclass):

        stm = select(self.tbl.c).where(and_(self.tbl.c.base_dynclass == dynclass))

        rows = self.fetch_all_dict(stm)

        return rows

    def get_asteroids_by_dynclass(self, dynclass):

        stm = select(self.tbl.c).where(and_(self.tbl.c.dynclass == dynclass))

        rows = self.fetch_all_dict(stm)

        return rows

    def ccds_by_asteroid(self, asteroid_name):

        # des_exposure
        de = self.get_table("des_exposure")
        # des_ccd
        dc = self.get_table("des_ccd")
        # Des skybot position
        ds = self.get_table("des_skybotposition")
        # Skybot Position
        sp = self.get_table("skybot_position")

        # Clausula where pelo nome do objeto OBRIGATORIO.
        clause = list([sp.c.name == asteroid_name])

        columns = [dc.c.id, de.c.date_obs, de.c.exptime, dc.c.path, dc.c.filename]

        stm = (
            select(columns)
            .select_from(
                ds.join(sp, ds.c.position_id == sp.c.id)
                .join(dc, ds.c.ccd_id == dc.c.id)
                .join(de, ds.c.exposure_id == de.c.id)
            )
            .where(and_(and_(*clause)))
        )

        rows = self.fetch_all_dict(stm)

        return rows
