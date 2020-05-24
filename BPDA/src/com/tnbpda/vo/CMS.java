package com.tnbpda.vo;

import java.io.Serializable;

public class CMS  implements Serializable{
	 private boolean avaialble;
		private String macType;
		/**
		 * @return the avaialble
		 */
		public boolean isAvaialble() {
			return avaialble;
		}
		/**
		 * @param avaialble the avaialble to set
		 */
		public void setAvaialble(boolean avaialble) {
			this.avaialble = avaialble;
		}
		/**
		 * @return the macType
		 */
		public String getMacType() {
			return macType;
		}
		/**
		 * @param macType the macType to set
		 */
		public void setMacType(String macType) {
			this.macType = macType;
		}
		 
	
	
}
