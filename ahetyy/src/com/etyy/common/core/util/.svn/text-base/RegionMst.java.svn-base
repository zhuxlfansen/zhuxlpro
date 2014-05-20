package ustc.yzwx.common.core.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import ustc.yzwx.business.student.RegionService;
import ustc.yzwx.presentation.student.form.Region;

/**
 * @author user
 *
 */
public final class RegionMst {

	/** 地域用Service */
	private static RegionService regionService = null;

	/** 省，直辖市List */
	private static List<Region> provinceList = new ArrayList<Region>();

	/** 省市Map */
	private static Map<Integer, List<Region>> regionMap = new HashMap<Integer, List<Region>>();

	/**
	 * 设置service
	 * 
	 * @param service
	 */
	public static void setRegionService(RegionService service) {
		RegionMst.regionService = service;
	}
	
	/**
	 * 根据市Id查找省直辖市Id
	 * @return
	 */
	public static int getParentId(int id) {
		Iterator<Integer> iterator = RegionMst.regionMap.keySet().iterator();
		List<Region> list = null;
		Integer key = null;
		Integer parentId = null;
		while (iterator.hasNext()) {
			key = (Integer) iterator.next();
			list = RegionMst.regionMap.get(key);
			for (Region region : list) {
				if (region.getId() == id) {
					parentId = region.getParentId();
					break;
				}
			}
			if (parentId != null) {
				break;
			}
		}

		return parentId;
	}
	
	/**
	 * 根据Id查找地域
	 * @param id
	 * @return
	 */
	public static Region selectRegionById(int id) {
		Iterator<Integer> iterator = RegionMst.regionMap.keySet().iterator();
		List<Region> list = null;
		Integer key = null;
		while (iterator.hasNext()) {
			key = (Integer) iterator.next();
			list = RegionMst.regionMap.get(key);
			for (Region region : list) {
				if (region.getId() == id) {
					return region;
				}
			}
		}
		return null;
	}
	
	/**
	 * 根据code查找地域
	 * @param code
	 * @return
	 */
	public static Region selectRegionByCode(String code) {
		Iterator<Integer> iterator = RegionMst.regionMap.keySet().iterator();
		List<Region> list = null;
		Integer key = null;
		while (iterator.hasNext()) {
			key = (Integer) iterator.next();
			list = RegionMst.regionMap.get(key);
			for (Region region : list) {
				if (region.getCode().equals(code)) {
					return region;
				}
			}
		}
		return null;
	}
	
	/**
	 * 根据省 直辖市id查询其下所属市县
	 * @param parentId
	 * @return
	 */
	public static List<Region> getCity(int parentId) {
		List<Region> result = new ArrayList<Region>();
		result = RegionMst.regionMap.get(parentId);
		result.remove(result.size()-1);
		return result;
	}
	
	/**
	 * 获取所有省直辖市
	 * @return
	 */
	public static List<Region> getProvince() {
		return RegionMst.provinceList;
	}

	/**
	 * 初始化
	 */
	public static void setup() {

		// 获取所有省，直辖市
		RegionMst.provinceList = regionService.getProvince();
		List<Region> list = null;
		// 省市Map的设定
		for (Region province : provinceList) {
			list = regionService.getCity(province.getId());
			list.add(province);
			RegionMst.regionMap.put(province.getId(), list);
		}
	}
}
